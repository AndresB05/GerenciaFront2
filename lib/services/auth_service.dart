/*
  AuthService

  - Uses Dio to call the backend endpoints for register and login.
  - Stores JWT in SharedPreferences after successful login.

  Notes for Flutter Web / CORS:
  - If you run the frontend in the browser and the backend is on localhost,
    you may hit CORS/preflight issues. Ensure your NestJS backend enables CORS
    (e.g. app.enableCors() or use the cors middleware) and that it responds
    to OPTIONS preflight requests. See backend docs for details.
  - When testing on Android emulator use 10.0.2.2 instead of localhost.
*/
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/url.dart';
import '../models/user.dart';
import '../models/auth_response.dart';
import 'dio_client.dart';

class AuthService {
  final String baseUrl;
  final DioClient _client = DioClient();

  AuthService() : baseUrl = '$urlBack/api/auth';

  /// Register a new user.
  /// Returns a map with { success: bool, data: User? , message: String? }
  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final uri = '$baseUrl/register';
    try {
      print('[AuthService] POST $uri');
      print('[AuthService] Body: {name: $name, email: $email, password: ****}');

      final response = await _client.dio.post(
        uri,
        data: {'name': name, 'email': email, 'password': password},
      );

      print('[AuthService] Response status: ${response.statusCode}');
      print('[AuthService] Response data: ${response.data}');

      if (response.statusCode == 201) {
        final user = User.fromJson(response.data as Map<String, dynamic>);
        return {'success': true, 'data': user};
      }

      return {
        'success': false,
        'message':
            'Registro fallido: ${response.statusCode} - ${response.data}',
      };
    } on DioException catch (e) {
      print('[AuthService] DioException (${e.type}): ${e.message}');
      if (e.response != null) {
        return {
          'success': false,
          'message': 'Error ${e.response?.statusCode}: ${e.response?.data}',
        };
      }
      return {'success': false, 'message': 'Error de red: ${e.message}'};
    } catch (e) {
      print('[AuthService] Unexpected error: $e');
      return {'success': false, 'message': 'Error inesperado: $e'};
    }
  }

  /// Login user. Stores JWT in SharedPreferences on success.
  /// Returns { success: bool, data: AuthResponse? , message: String? }
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final uri = '$baseUrl/login';
    try {
      print('[AuthService] POST $uri');
      print('[AuthService] Body: {email: $email, password: ****}');

      final response = await _client.dio.post(
        uri,
        data: {'email': email, 'password': password},
      );

      print('[AuthService] Response status: ${response.statusCode}');
      print('[AuthService] Response data: ${response.data}');

      if (response.statusCode == 200) {
        final auth = AuthResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        // persist token
        try {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt_token', auth.token);
          print('[AuthService] Token stored in SharedPreferences');
        } catch (e) {
          print('[AuthService] Failed to store token: $e');
        }
        return {'success': true, 'data': auth};
      }

      return {
        'success': false,
        'message': 'Login fallido: ${response.statusCode} - ${response.data}',
      };
    } on DioException catch (e) {
      print('[AuthService] DioException (${e.type}): ${e.message}');
      if (e.response != null) {
        return {
          'success': false,
          'message': 'Error ${e.response?.statusCode}: ${e.response?.data}',
        };
      }
      return {'success': false, 'message': 'Error de red: ${e.message}'};
    } catch (e) {
      print('[AuthService] Unexpected error: $e');
      return {'success': false, 'message': 'Error inesperado: $e'};
    }
  }

  /// Helper to read stored token (if any)
  Future<String?> getStoredToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt_token');
    } catch (e) {
      print('[AuthService] getStoredToken error: $e');
      return null;
    }
  }

  /// Helper to clear stored token
  Future<void> clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('jwt_token');
    } catch (e) {
      print('[AuthService] clearToken error: $e');
    }
  }
}
