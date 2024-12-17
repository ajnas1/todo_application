import 'package:flutter/material.dart';
import 'package:todo/utlities/constants.dart';

Widget settingsElementswidget(IconData icon,String title) {
  return  ListTile(
    onTap: (){},
    leading: Icon(icon,size: 30,),
    title: Text(title,style: const TextStyle(fontSize: settingsScreenSmallTitleSize,fontWeight: FontWeight.bold),),
  );
}
