import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final String text;
  final Color? textcolor;
  final Color? buttoncolor;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  final double width;
  const AppButtons(
      {required this.text,
      this.textcolor,
      this.buttoncolor,
      this.textStyle,
      this.onPressed,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: buttoncolor),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(text),
          ),
          onPressed: onPressed),
    );
  }
}
