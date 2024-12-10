import 'package:flutter/material.dart';
import 'package:todo/utlities/colors.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/register_screen.dart';
import 'package:todo/widget/continue_button_widget.dart';
import 'package:todo/widget/textField_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

  void callback(BuildContext context) {}
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.19),
                child: const Text(
                  'Create An Account',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextFieldWidget(_emailController, label: 'Email'),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Enter the email address you used to reate your account and',
              style: TextStyle(color: Colors.black, fontSize: 12.5),
            ),
          ),
          const Center(
            child: Text('we will email you a link to reset your password',
                style: TextStyle(color: Colors.black, fontSize: 12.5)),
          ),
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
              Text('Don\'t have account? '),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: Text(
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
