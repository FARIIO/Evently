import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/main.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(EventlyImages.evently),
              Text(
                AppLocalizations.of(context)!.loginTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ) 
      ),
    );
  }

}