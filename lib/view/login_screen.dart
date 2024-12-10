

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/utlities/colors.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/forgotPassword_screen.dart';
import 'package:todo/view/register_screen.dart';
import 'package:todo/widget/continue_button_widget.dart';
import 'package:todo/widget/textField_widget.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void callback(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          const Center(
            child: Text(
              'MIMO',
              style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFieldWidget(_emailController, label: 'Email'),
          const SizedBox(
            height: 15,
          ),
          TextFieldWidget(_passwordController, label: 'Password'),
          const SizedBox(
            height: 5,
          ),
          Padding(
              padding: loginScreenPadding,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) => ForgotPasswordScreen()));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: authenticationScreensClickableTextColor,
                      fontWeight: FontWeight.bold),
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: loginScreenPadding,
              child: cotinueButtonWidget(
                  context: context, title: 'Continue', callBack: callback)),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have account? '),
              GestureDetector(
                onTap: () {
                  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: authenticationScreensClickableTextColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
