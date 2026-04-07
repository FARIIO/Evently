import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/tabs/favorite/widgets/search_form_field.dart';
import 'package:evently/tabs/home/widgets/event_item.dart';
import 'package:evently/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class FavoriteTab extends StatefulWidget{
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height*0.01
          ),
          child: Column(
            spacing: height * 0.02,
            children: [
              SearchFormField(
                isSuffix: true,
                hintText: AppLocalizations.of(context)!.searchForEvent,
                validator: (value){
                  return null;
                },
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return EventItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.01,);
                    },
                    itemCount: 10
                ),
              ),
            ],
          )
                ),
              )
    );
  }

}