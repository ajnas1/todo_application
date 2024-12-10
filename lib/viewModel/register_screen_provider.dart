import 'package:flutter/material.dart';
import 'package:todo/model/register_errors_model.dart';
import 'package:todo/services/firebase_services.dart';

class RegisterScreenProvider extends ChangeNotifier{
  RegisterErrorsModel _registerErrorsModel = RegisterErrorsModel();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _conformPasswrdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterErrorsModel get registerErrorsModel => _registerErrorsModel;
  TextEditingController get fullNameController=>_fullNameController;
  TextEditingController get emailController=>_emailController;
  TextEditingController get conformPasswordController=>_conformPasswrdController;
  TextEditingController get passwordController=>_passwordController;

  void registerAccount() async {
    bool isError = false;
    if(_fullNameController.text.isEmpty){
      registerErrorsModel.fullNameError = 'Please enter your fullName';
      isError = true;
      print(registerErrorsModel.fullNameError);
    }
    if(_emailController.text.isEmpty) {
      registerErrorsModel.emailError = 'Please enter your email';
      isError = true;
    }
    if(passwordController.text.isEmpty) {
      registerErrorsModel.passwordError = 'Please enter your password';
      isError = true;
    }
    if(_conformPasswrdController.text.isEmpty) {
      registerErrorsModel.confromPasswordError = 'Please enter your conform password';
      isError = true;
    }
    if(_conformPasswrdController.text != _passwordController.text) {
      registerErrorsModel.confromPasswordError = 'conform password not match with password';
      isError = true;
    }
    if(!isError) {
      var response =  await FirebaseServices().registerAccount(_emailController.text, _passwordController.text,registerErrorsModel);
      if(response is RegisterErrorsModel) {
        registerErrorsModel.emailError = response.emailError;
        registerErrorsModel.passwordError = response.passwordError;
        notifyListeners();
      }
    }else {
      notifyListeners();
    } 
  }
}