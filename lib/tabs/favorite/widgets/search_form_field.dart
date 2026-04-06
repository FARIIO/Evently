import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../utils/evently_colors.dart';

class SearchFormField extends StatefulWidget{
  @override
  State<SearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<SearchFormField> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = context.height;
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: EventlyColors.mainBlue,
      cursorHeight: height * 0.03,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: InputDecoration(
          filled: true,
          hintText: AppLocalizations.of(context)!.searchForEvent,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          hoverColor:
          themeProvider.isDark
              ? Theme.of(context).primaryColor
              : EventlyColors.white,
          focusColor:
          themeProvider.isDark
              ? Theme.of(context).primaryColor
              : EventlyColors.white,
          border: buildOutlineInputBorder(themeProvider),
          enabledBorder: buildOutlineInputBorder(themeProvider),
          focusedBorder: buildOutlineInputBorder(themeProvider),
          errorBorder: buildOutlineInputBorder(themeProvider),
          disabledBorder: buildOutlineInputBorder(themeProvider),
          fillColor:
          themeProvider.isDark
              ? Theme.of(context).cardColor
              : EventlyColors.white,
          suffixIcon:
          Icon(Icons.search_rounded),
          suffixIconColor: Theme.of(context).primaryColor
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(dynamic themeProvider){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color:
            themeProvider.isDark?
            Theme.of(context).dividerColor:
            Theme.of(context).dividerColor,
            width: 1
        )
    );
  }
}