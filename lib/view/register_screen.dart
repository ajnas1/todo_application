import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utlities/colors.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/viewModel/register_screen_provider.dart';
import 'package:todo/widget/continue_button_widget.dart';
import 'package:todo/widget/textField_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
 

  void callback(BuildContext context) {
    print('dfjndf');
    Provider.of<RegisterScreenProvider>(context,listen: false).registerAccount();
                   // Navigator.push(context, MaterialPageRoute(builder:(context) => RegisterScreen(),));
                  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:  Consumer<RegisterScreenProvider>(
        builder:(context, value, child) =>  Column(
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
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(Icons.arrow_back)),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.19),
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
              height: 30,
            ),
            TextFieldWidget(value.fullNameController, label: 'Full Name',error: value.registerErrorsModel.fullNameError),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(value.emailController, label: 'Email',error: value.registerErrorsModel.emailError),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(value.passwordController, label: 'Password',error: value.registerErrorsModel.passwordError),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(value.conformPasswordController, label: 'Conform Password',error: value.registerErrorsModel.confromPasswordError,),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: loginScreenPadding,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: authenticationScreensClickableTextColor,fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: loginScreenPadding,
                child: cotinueButtonWidget(
                    context: context, title: 'Continue', callBack: callback)),
                    const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: () {},
                  child:  const Text(
                    'Log in',
                    style: TextStyle(color: authenticationScreensClickableTextColor,fontWeight: FontWeight.bold),
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