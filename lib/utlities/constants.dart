//login screen constants

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo/viewModel/register_screen_provider.dart';

final List<SingleChildWidget> provider = [
    ChangeNotifierProvider(create: (context) => RegisterScreenProvider()),
];

const EdgeInsets  loginScreenPadding = EdgeInsets.only(left: 30);


