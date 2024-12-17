//login screen constants

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo/viewModel/categoriesScreen_provider.dart';
import 'package:todo/viewModel/forgotpassword_screen_provider.dart';
import 'package:todo/viewModel/login_screen_provider.dart';
import 'package:todo/viewModel/register_screen_provider.dart';
import 'package:todo/viewModel/settingsProvider.dart';
import 'package:todo/viewModel/todoDetails_screen_provider.dart';

final List<SingleChildWidget> provider = [
    ChangeNotifierProvider(create: (context) => RegisterScreenProvider()),
    ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
    ChangeNotifierProvider(create: (context) => ForgotpasswordScreenProvider()),
    ChangeNotifierProvider(create:(context) => CategoriesscreenProvider()),
    ChangeNotifierProvider(create:(context) => TododetailsScreenProvider()),
    ChangeNotifierProvider(create:(context) => Settingsprovider()),
];


const EdgeInsets  authenticationScreensPadding = EdgeInsets.only(left: 30,right: 30);

//settings screen

const double settingsScreenSmallTitleSize = 15;


const double settingsScreenMediumTitleSize = 19;

const double settingsScreenLargeTitleSize = 25;

const EdgeInsets  settingsScreenPadding = EdgeInsets.only(left: 30,right: 30);

//categories screen

const double categoriesScreenMediumTitleSize = 19;

const double categoriesScreenSmallTitleSize = 12;



