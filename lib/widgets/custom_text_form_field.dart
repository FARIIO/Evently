import 'dart:ui';

import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/main.dart';
import 'package:evently/utils/dimensions.dart';
import 'package:evently/utils/evently_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  Widget prefixIcon;
  String hintText;

  CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText
  });
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: EventlyColors.mainBlue,
      cursorHeight: height * 0.03,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: InputDecoration(
        iconColor: EventlyColors.mainBlue,
        prefixIcon: prefixIcon,
          prefixIconColor: EventlyColors.greyDisable,
          hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        hoverColor: EventlyColors.white,
        focusColor: EventlyColors.white,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        fillColor: EventlyColors.white
      ),
    );
  }
OutlineInputBorder buildOutlineInputBorder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: EventlyColors.greyDisable,
      width: 1.5
    )
  );
}
}