import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/event_model.dart';
import '../providers/theme_provider.dart';
import '../tabs/favorite/widgets/search_form_field.dart';
import '../utils/dimensions.dart';
import '../utils/evently_colors.dart';
import '../widgets/custom_elevated_button.dart';

class EventDetailsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var width = context.width;
    var height = context.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.eventDetails,
          style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height*0.01
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                  themeProvider.isDark
                      ? Theme.of(context).cardColor
                      : EventlyColors.white,
                  border: BoxBorder.all(
                      color:
                      themeProvider.isDark
                          ? Theme.of(context).dividerColor
                          : EventlyColors.whiteLightStroke
                  )
              ),
              child: IconButton(
                highlightColor: EventlyColors.transparent,
                iconSize: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
                color:
                themeProvider.isDark
                    ? EventlyColors.white
                    : Theme.of(context).primaryColor,
              )
          ),
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                  themeProvider.isDark
                      ? Theme.of(context).cardColor
                      : EventlyColors.white,
                  border: BoxBorder.all(
                      color:
                      themeProvider.isDark
                          ? Theme.of(context).dividerColor
                          : EventlyColors.whiteLightStroke
                  )
              ),
              child: IconButton(
                highlightColor: EventlyColors.transparent,
                iconSize: 20,
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: FaIcon(FontAwesomeIcons.penToSquare),
                color:
                themeProvider.isDark
                    ? EventlyColors.white
                    : Theme.of(context).primaryColor,
              )
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                  themeProvider.isDark
                      ? Theme.of(context).cardColor
                      : EventlyColors.white,
                  border: BoxBorder.all(
                      color:
                      themeProvider.isDark
                          ? Theme.of(context).dividerColor
                          : EventlyColors.whiteLightStroke
                  )
              ),
              child: IconButton(
                highlightColor: EventlyColors.transparent,
                iconSize: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: FaIcon(FontAwesomeIcons.trashCan),
                color: EventlyColors.red
              )
          ),
        ],
        actionsPadding: EdgeInsetsGeometry.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.02
        ),
      ),
    );
  }
}