import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height*0.01
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(EventlyImages.evently),
                Text(
                  AppLocalizations.of(context)!.loginTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomTextFormField(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: AppLocalizations.of(context)!.enterEmail,
                ),
              ],
            ),
          ) 
      ),
    );
  }

}