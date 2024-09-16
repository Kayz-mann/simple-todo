import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  VoidCallback onPressed;

  Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(text),
        color: backgroundColor ?? Theme.of(context).primaryColor);
  }
}
