// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyCalcBtn extends StatelessWidget {
  final String buttonText;
  final btnClick;

  const MyCalcBtn({super.key, required this.buttonText, this.btnClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnClick,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
