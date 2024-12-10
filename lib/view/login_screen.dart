
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utlities/colors.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/forgotPassword_screen.dart';
import 'package:todo/view/register_screen.dart';
import 'package:todo/viewModel/login_screen_provider.dart';
import 'package:todo/widget/continue_button_widget.dart';
import 'package:todo/widget/textField_widget.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  void callback(BuildContext context) {
    Provider.of<LoginScreenProvider>(context,listen: false).loginInAccount();
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => RegisterScreen(),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Consumer<LoginScreenProvider>(
        builder:(context, value, child) =>  Column(
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
            TextFieldWidget(value.emailController, label: 'Email',error: value.loginErrorsModel.emailError,),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(value.passwordController, label: 'Password',error: value.loginErrorsModel.passwordError),
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
      ),
    );
  }
}
