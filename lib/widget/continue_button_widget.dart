import 'package:flutter/material.dart';
import 'package:todo/utlities/colors.dart';

Widget cotinueButtonWidget(
    {required BuildContext context,
    required String title,
    required Function callBack}) {
  return ElevatedButton(
    onPressed: () {
      print('fj');
      callBack(context);
      print('fj');
    },
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: authenticationScreensContiueButtonBackgroundColor,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.85,
            MediaQuery.of(context).size.height * 0.069)),
    child: Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
  );
}
