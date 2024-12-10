import 'package:flutter/material.dart';
import 'package:todo/utlities/constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(this._controller,
      {super.key, required, required this.label});
  final TextEditingController _controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: loginScreenPadding,
      height: 50,
      width: 380,
      child: Material(
        elevation: 4,
        shadowColor: Colors.black,
        color: Colors.white,
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
