import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldOtp extends StatelessWidget {
  bool first;
  bool last;
  bool correct;
  TextEditingController controller;

  TextFieldOtp({
    required this.controller,
    required this.correct,
    required this.first,
    required this.last,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(
        color: correct ? Colors.red : Colors.blueGrey,
        width: 1.5,

      ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        onChanged: ((value) {
          if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        }),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            border: InputBorder.none,
            constraints: BoxConstraints(
                maxWidth: MediaQuery
                    .sizeOf(context)
                    .width / 8,
                maxHeight: MediaQuery
                    .sizeOf(context)
                    .width / 8
            )),),);
  }
}