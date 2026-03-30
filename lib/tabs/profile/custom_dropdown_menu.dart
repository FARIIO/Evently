import 'package:evently/utils/evently_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/language_provider.dart';

class CustomDropdownMenu extends StatefulWidget{
  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String selectedLanguage = "en";
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: EventlyColors.white,
          border: BoxBorder.all(
            color: EventlyColors.whiteLightStroke
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButton<String>(
          padding: EdgeInsetsGeometry.symmetric(
              horizontal: 16
          ),
          underline: SizedBox(),
          value: selectedLanguage,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: EventlyColors.mainBlue,
          ),
          isExpanded: true,
          borderRadius: BorderRadius.circular(16),
          menuWidth: MediaQuery.of(context).size.width*0.65,
          items: [
            DropdownMenuItem(
                value: "en",
                child: Text(AppLocalizations.of(context)!.english),
            ),
            DropdownMenuItem(
                value: "ar",
                child:  Text(AppLocalizations.of(context)!.arabic),
            )
          ],
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue!;
              languageProvider.changeLanguage(newValue);
            });
          },
        ),
      ),
    );
  }

}