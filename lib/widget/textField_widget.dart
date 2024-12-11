import 'package:flutter/material.dart';
import 'package:todo/utlities/constants.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget(this._controller,
      {super.key, required, required this.label,this.error});
  final TextEditingController _controller;
  final String label;
  String? error;
  @override
  Widget build(BuildContext context) {
    print(error);
    return Container(
      padding: authenticationScreensPadding,
      height: 90,
      width: MediaQuery.of(context).size.width * 0.99,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          errorText: error,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: Colors.red)
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: Colors.black)
          ),
          labelText: label,
        ),
      ),
    );
  }
}
