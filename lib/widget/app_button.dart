import 'package:flutter/material.dart';
import 'package:whats_app/core/colors/colors.dart';

import 'app_text.dart';


class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(30),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: mainColor),
            child: Align(
                alignment: Alignment.center,
                child: AppText(
                  text: title,
                  color: Colors.white,
                )),
          ),
        ),
      );
  }
}