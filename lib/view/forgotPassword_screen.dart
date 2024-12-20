import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utlities/colors.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/register_screen.dart';
import 'package:todo/viewModel/forgotpassword_screen_provider.dart';
import 'package:todo/widget/continue_button_widget.dart';
import 'package:todo/widget/textField_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  void callback(BuildContext context) {
    Provider.of<ForgotpasswordScreenProvider>(context,listen: false).resetPassword();
  }
  @override
  Widget build(BuildContext context) {
  var forgotpasswordScreenProvider = context.read<ForgotpasswordScreenProvider>();
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
                  'Forgot Password',
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
          TextFieldWidget(forgotpasswordScreenProvider.emailController, label: 'Email'),
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
              padding: authenticationScreensPadding,
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
                        builder: (context) => const RegisterScreen(),
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
