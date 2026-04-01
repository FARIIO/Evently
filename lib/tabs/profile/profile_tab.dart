import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/tabs/profile/custom_dropdown_menu.dart';
import 'package:evently/tabs/profile/custom_theme_switch.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:flutter/material.dart';

import '../../utils/evently_colors.dart';

class ProfileTab extends StatefulWidget{
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? dropDownValue;
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    dropDownValue ??= AppLocalizations.of(context)!.english;
    return Scaffold(
   appBar: AppBar(
     title: Text(AppLocalizations.of(context)!.language),
   ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: EdgeInsets.all(12),
           child: showDropdownMenu(dropDownValue: dropDownValue),
         ),
         Padding(
           padding: EdgeInsets.all(16),
           child: Container(
             decoration: BoxDecoration(
               color: EventlyColors.white,
               border: BoxBorder.all(
                   color: EventlyColors.whiteLightStroke
               ),
               borderRadius: BorderRadius.circular(16),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text(
                   AppLocalizations.of(context)!.darkMode,
                   style: TextStyle(
                     fontSize: 20,
                     color: Colors.black
                   ),
                 ),
                 CustomThemeSwitch()
               ],
             ),
           ),
         ),
         ElevatedButton(onPressed: () {
           Navigator.pushNamed(context, EventlyRoutes.loginScreen);
         }, child: Text("intro"))
       ],
     ),
   );
  }

  Widget showDropdownMenu({required dropDownValue}){
    return CustomDropdownMenu();
  }
}