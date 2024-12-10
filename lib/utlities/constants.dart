//login screen constants

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo/viewModel/forgotpassword_screen_provider.dart';
import 'package:todo/viewModel/login_screen_provider.dart';
import 'package:todo/viewModel/register_screen_provider.dart';

final List<SingleChildWidget> provider = [
    ChangeNotifierProvider(create: (context) => RegisterScreenProvider()),
    ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
    ChangeNotifierProvider(create: (context) => ForgotpasswordScreenProvider()),
];


const EdgeInsets  loginScreenPadding = EdgeInsets.only(left: 30);


