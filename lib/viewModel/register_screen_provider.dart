import 'package:flutter/material.dart';

class RegisterScreenProvider extends ChangeNotifier{
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _conformController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get fullNameController=>_fullNameController;
  TextEditingController get emailController=>_emailController;
  TextEditingController get conformPasswordController=>_conformController;
  TextEditingController get passwordController=>_passwordController;

  void registerAccount() {
    //FirebaseServices().registerAccount(_emailController.text, _passwordController.text);
  }
}