import 'package:evently/utils/evently_routes.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/dimensions.dart';

class CustomElevatedButton extends StatelessWidget{
  PageController controller;
  String title;
  int index;

  CustomElevatedButton({
    super.key,
    required this.controller,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height*0.01
      ),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor
              ),
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  )
              )
          ),
          onPressed: (){
            index == 2
                ? Navigator.pushReplacementNamed(context, EventlyRoutes.loginScreen)
                : controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height*0.015,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
      ),
    );
  }

}