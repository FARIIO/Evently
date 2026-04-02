import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/tabs/profile/custom_container_button.dart';
import 'package:evently/tabs/profile/custom_dropdown_menu.dart';
import 'package:evently/tabs/profile/custom_theme_switch.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../utils/dimensions.dart';
import '../../utils/evently_colors.dart';

class ProfileTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height*0.01
      ),
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                EventlyImages.route,
              ),
              minRadius: height * 0.02,
              maxRadius: height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(
                    top: height * 0.02,
                    bottom: height * 0.01
              ),
              child: Text(
                "Fares Ahmed",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: height * 0.04
            ),
              child: Text(
                  "fares.ahmed@gmail.com",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            CustomContainerButton(
                title: AppLocalizations.of(context)!.darkMode,
                suffix: CustomThemeSwitch(
                  themeMode: themeProvider.appTheme,
                ),
              paddingHeight:  0,
              paddingWidth: width * 0.05,
            ),
            CustomDropdownMenu(),
            CustomContainerButton(
              title: AppLocalizations.of(context)!.logout,
              suffix: FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: EventlyColors.red,),
              paddingHeight:  height * 0.015,
              paddingWidth: width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

}