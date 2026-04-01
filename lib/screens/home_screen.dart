import 'package:evently/tabs/favorite/favorite_tab.dart';
import 'package:evently/tabs/home/home_tab.dart';
import 'package:evently/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import '../utils/evently_colors.dart';
import '../utils/evently_text_style.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  List<Widget> tabsList = [
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: CustomNavBar(themeProvider, context),
      body: tabsList[newIndex],
    );
  }

Widget? CustomNavBar(dynamic themeProvider, BuildContext context){
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
    currentIndex: newIndex,
    onTap: (index) {
      setState(() {
        newIndex = index;
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