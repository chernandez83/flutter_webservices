import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String text;
  const TextError(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 26,
        color: Colors.white,
      ),
    );
  }

}