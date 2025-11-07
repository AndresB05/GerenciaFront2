import 'package:dio/dio.dart';
import '../models/product.dart';
import '../helpers/url.dart';
import 'dio_client.dart';

class ProductService {
  final String baseUrl;
  final DioClient _client = DioClient();

  ProductService() : baseUrl = '$urlBack/api';
  Future<List<Product>> getProducts({int page = 1, int length = 30}) async {
    final uri = '$baseUrl/products';
    try {
      print('Making request to: $uri');
      print('Request data: {"page": $page, "length": $length}');

      final response = await _client.dio.post(
        uri,
        data: {'page': page, 'length': length},
      );

      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers.map}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        if (jsonResponse['success'] == true &&
            jsonResponse['data'] != null &&
            jsonResponse['data']['products'] != null) {
          final List<dynamic> productsJson = jsonResponse['data']['products'];
          return productsJson.map((json) => Product.fromJson(json)).toList();
        } else {
          throw Exception('Formato de datos inesperado: ${response.data}');
        }
      } else {
        throw Exception(
          'Error del servidor: ${response.statusCode} ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      print('DioException: type=${e.type}');
      print(
        'RequestOptions: ${e.requestOptions.method} ${e.requestOptions.uri}',
      );
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
        throw Exception(
          'Error HTTP ${e.response?.statusCode}: ${e.response?.data}',
        );
      } else {
        if (e.type == DioExceptionType.connectionError) {
          throw Exception(
            'Error de conexión: No se pudo conectar al backend. Revisa URL y que el servidor esté corriendo.',
          );
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          throw Exception(
            'Timeout: el servidor está tardando demasiado en responder.',
          );
        } else {
          throw Exception('Error de red: ${e.message}');
        }
      }
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
