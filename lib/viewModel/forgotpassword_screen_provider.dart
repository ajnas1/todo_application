import 'package:flutter/material.dart';
import 'package:todo/services/firebase_services.dart';

class ForgotpasswordScreenProvider extends ChangeNotifier{
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController=>_emailController;

  void resetPassword() {
    print(_emailController.text.isNotEmpty);
    if(_emailController.text.isNotEmpty) {
      FirebaseServices().resetPassword(_emailController.text);
    }
    
  }

}