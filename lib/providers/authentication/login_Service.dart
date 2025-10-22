import 'package:dio/dio.dart';
import 'package:greenflow/helpers/url.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(Map<String, String> user) async {

  final userName = user["userName"] ?? "";
  final password = user["password"] ?? "";

    final data = {
  "correo": userName,
  "contraseña": password,
};

  print(" ✅ User Info: $data", );

    try {
      // final response = await _dio.get("http://192.168.194.98:3000/auth/login");
      final response = await Dio().post(
      "$urlBack/auth/login",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
      if (response.statusCode == 201) {
      print("✅ LOGIN CORRECTO");
      
      return response.data; // 🔹 Devuelve la respuesta del servidor
    } else {
      print("⚠ Error al HACER LOGIN: ${response.statusCode}");
      return {}; // 🔹 Devuelve una lista vacía en caso de error
    }
    } catch (e) {
      throw Exception("Error  $e");
    }
  }

  Future<Map<String, dynamic>>  register(Map<String, String> user) async {
  final firstName = user["firstName"] ?? "";
  final lastName = user["lastName"] ?? "";
  final email = user["email"] ?? "";
  final password = user["password"] ?? "";
  final confirmPassword = user["confirmPassword"] ?? "";
  final securityQuestion = user["securityQuestion"] ?? "";
  final securityAnswer = user["securityAnswer"] ?? "";
  final phone = user["phone"] ?? "";
  final city = user["city"] ?? "";
  final country = user["country"] ?? "";
  final address = user["Address"] ?? "";
  final postalCode = user["postalCode"] ?? "";

  print("User Info:");
  print("First Name: $firstName");
  print("Last Name: $lastName");
  print("Email: $email");
  print("Password: $password");
  print("Confirm Password: $confirmPassword");
  print("Security Question: $securityQuestion");
  print("Security Answer: $securityAnswer");
  print("Phone: $phone");
  print("City: $city");
  print("Country: $country");
  print("Address: $address");
  print("Postal Code: $postalCode");

  // final data = {
  //   "nombre": firstName,
  //   "apellido": lastName,
  //   "correo": email,
  //   "contraseña": password,
  //   "contacto": phone,
  // };

  final data = {
  "nombre": "gerson",
  "apellido": "Pérez",
  "correo": "gerson.perez@example.com",
  "contraseña": "miContraseñaSegura123",
  "contacto": "+1234567890"
};

  try {
    final response = await Dio().post(
      "$urlBack/auth/register",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 201) {
      print("✅ Usuario registrado exitosamente");
      
      return response.data; // 🔹 Devuelve la respuesta del servidor
    } else {
      print("⚠ Error al registrar: ${response.statusCode}");
      return {}; // 🔹 Devuelve una lista vacía en caso de error
    }
  } catch (e) {
    print("❌ Error al hacer la petición: $e");
    return {}; // 🔹 Devuelve una lista vacía si hay un error
  }
}}