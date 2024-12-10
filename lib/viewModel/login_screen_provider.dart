import 'package:flutter/material.dart';
import 'package:todo/model/register_errors_model.dart';
import 'package:todo/services/firebase_services.dart';

class LoginScreenProvider extends ChangeNotifier {
  RegisterErrorsModel _registerErrorsModel = RegisterErrorsModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterErrorsModel get loginErrorsModel => _registerErrorsModel;
  TextEditingController get emailController=>_emailController;
  TextEditingController get passwordController=>_passwordController;

  void loginInAccount() async {
    bool isError = false;
    print(_emailController.text);
    if(_emailController.text.isEmpty) {
      loginErrorsModel.emailError = 'Please enter your email';
      isError = true;
    }
    if(passwordController.text.isEmpty) {
      loginErrorsModel.passwordError = 'Please enter your password';
      print(loginErrorsModel.passwordError);
      isError = true;
    }
    if(!isError) {
      var response = await FirebaseServices().logInAccount(_emailController.text, _passwordController.text,loginErrorsModel);
    if(response is RegisterErrorsModel) {
      loginErrorsModel.emailError = response.emailError;
      loginErrorsModel.passwordError = response.passwordError;
      notifyListeners();
    }
    }else {
      notifyListeners();
    } 
    print(passwordController.text);
    notifyListeners();
    
  }
}