import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  final String text;
  VoidCallback onPressed;
   MyButtons({super.key, required this.text, required this.onPressed});

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow,
        onPressed: widget.onPressed,
        child: Text(widget.text),);
  }
}
