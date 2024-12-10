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
    Provider.of<RegisterScreenProvider>(context,listen: false).registerAccount();
                    Navigator.push(context, MaterialPageRoute(builder:(context) => RegisterScreen(),));
                  }
  @override
  Widget build(BuildContext context) {
    final registerScreenProvider = Provider.of<RegisterScreenProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body:  Column(
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
                icon: Icon(Icons.arrow_back)),
              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.19),
                child: Text(
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
          TextFieldWidget(registerScreenProvider.fullNameController, label: 'Full Name'),
          const SizedBox(
            height: 15,
          ),
          TextFieldWidget(registerScreenProvider.emailController, label: 'Email'),
          const SizedBox(
            height: 15,
          ),
          TextFieldWidget(registerScreenProvider.passwordController, label: 'Password'),
          const SizedBox(
            height: 15,
          ),
          TextFieldWidget(registerScreenProvider.conformPasswordController, label: 'Conform Password'),
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
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: loginScreenPadding,
              child: cotinueButtonWidget(
                  context: context, title: 'Continue', callBack: callback)),
                  SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? '),
              GestureDetector(
                onTap: () {},
                child:  Text(
                  'Log in',
                  style: TextStyle(color: authenticationScreensClickableTextColor,fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}