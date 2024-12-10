import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/login_screen.dart';

class AuthenticationFlow extends StatelessWidget {
  const AuthenticationFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder:(context, snapshot) {
          if(snapshot.hasData) {
            return Scaffold();
          }else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}