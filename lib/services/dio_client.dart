import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton Dio client with an interceptor that injects the stored JWT token
/// into the Authorization header for every request (if present).
class DioClient {
  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 5),
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString('jwt_token');
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } catch (e) {
            // ignore storage errors; request will proceed without token
            print('[DioClient] Error reading token: $e');
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // Basic logging; more advanced handling (refresh token) can be added here
          print('[DioClient] Request error: ${error.error}');
          handler.next(error);
        },
      ),
    );
  }

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late final Dio dio;
}
