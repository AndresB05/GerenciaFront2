import 'package:flutter/material.dart';
import 'package:greenflow/providers/authentication/login_Service.dart';

class AuthenticationProvider with ChangeNotifier {
final LoginService _userService = LoginService();

  bool _isLoading = false;
  bool _exito = false;

  bool get isLoading => _isLoading;
  bool get exito => _exito;



//-------------------Actions---------------------------
  Future<void> loginUser(Map<String, String> user) async {
    _isLoading = true;
    notifyListeners();
    try {
       await _userService.login(user);
        _exito = true;
        notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerUser(Map<String, String> user) async {
    _isLoading = true;
    notifyListeners();

    try {
       await _userService.register(user);
           _exito = true;
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

    Future<void> reiniciarExito() async {
    _isLoading = false;
    _exito = false;
    notifyListeners();


  }
//-------------------------------------------------

}