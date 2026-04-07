import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/tabs/home/widgets/event_item.dart';
import 'package:evently/tabs/home/widgets/tab_widget.dart';
import 'package:evently/utils/dimensions.dart';
import 'package:evently/utils/evently_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/evently_icons.dart';

class HomeTab extends StatefulWidget{
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List <String> eventCategory = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
    List <FaIconData?> icons = [
      FontAwesomeIcons.sort,
      FontAwesomeIcons.bicycle,
      FontAwesomeIcons.cakeCandles,
      FontAwesomeIcons.book,
      FontAwesomeIcons.palette,
    ];
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
          children: [
            Row(
              spacing: width * 0.04,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back ✨",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                        "Fares Ahmed",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  themeProvider.isDark ?
                      EventlyIcons.darkModeUnfill
                      : EventlyIcons.lightModeUnfill,
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.008,
                    horizontal: width * 0.02
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                      languageProvider.appLanguage == "en"?
                      AppLocalizations.of(context)!.en
                          : AppLocalizations.of(context)!.ar,
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                )
              ],
            ),
            Expanded(
              child: DefaultTabController(
                  length: eventCategory.length,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.015,
                            vertical: height * 0.02
                          ),
                          indicatorColor: EventlyColors.transparent,
                          dividerColor: EventlyColors.transparent,
                          overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
                          tabAlignment: TabAlignment.start,
                          onTap: (index) {
                            selectedIndex = index;
                            setState(() {

                            });
                          },
                          tabs: eventCategory.map((eventName) {
                            int index = eventCategory.indexOf(eventName);
                            return TabWidget(
                                eventName: eventName,
                              icon: icons[index],
                                iconSelectedColor: EventlyColors.white,
                                iconUnSelectedColor: Theme.of(context).primaryColor,
                              isSelected: selectedIndex == eventCategory.indexOf(eventName),
                              selectedColor: Theme.of(context).primaryColor,
                              unselectedColor: Theme.of(context).cardColor,
                            );
                          },).toList()
                      ),
                      Expanded(
                          child:
                          ListView.separated(
                              itemBuilder: (context, index) {
                                return EventItem();
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: height*0.01,);
                              },
                              itemCount: 10
                          )
                      )
                    ],
                  )
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
}