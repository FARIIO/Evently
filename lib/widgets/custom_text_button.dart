import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget{
  void Function()? onPressed;
  String text;
  TextStyle? textStyle;

  CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle
        ),
    );
  }

}