import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../utils/evently_colors.dart';
import '../utils/evently_text_style.dart';

class CustomNavBar extends StatefulWidget{
    int newIndex = 0;
   CustomNavBar({super.key,required this.newIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return BottomNavigationBar(
      enableFeedback: false,
      backgroundColor: themeProvider.isDark
          ? Theme.of(context).highlightColor
          : Theme.of(context).cardColor ,
      selectedLabelStyle: themeProvider.isDark
          ? EventlyTextStyle.lightBlueSemiBold12
          : EventlyTextStyle.lightBlueSemiBold12 ,
      unselectedLabelStyle: themeProvider.isDark
          ? EventlyTextStyle.lightBlueSemiBold12
          : EventlyTextStyle.lightBlueSemiBold12 ,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: EventlyColors.greyDisable,
      currentIndex: widget.newIndex,
      onTap: (index) {
        setState(() {
          widget.newIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house),
          label: AppLocalizations.of(context)!.home,
          activeIcon: FaIcon(
            FontAwesomeIcons.solidHouse,
            color: Theme.of(context).primaryColor,
          ),
        ),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heart),
          label: AppLocalizations.of(context)!.favorite,
          activeIcon: FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Theme.of(context).primaryColor,
          ),
        ),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user),
          label: AppLocalizations.of(context)!.profile,
          activeIcon: FaIcon(
            FontAwesomeIcons.solidUser,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
  }
