import 'package:evently/utils/dimensions.dart';
import 'package:evently/utils/evently_colors.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class EventItem extends StatefulWidget{
  bool isSelected;

  EventItem({super.key,this.isSelected = false});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    return InkWell(
      overlayColor: WidgetStatePropertyAll(
        EventlyColors.transparent
      ),
      onTap: onEventTab,
      child: Container(
        height: height * 0.22,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
          image: DecorationImage(
              image: AssetImage(
                themeProvider.isDark ?
                  EventlyImages.sportDark
                    : EventlyImages.sportLight
              ),
            fit: BoxFit.fill
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.027,
            vertical: height * 0.015
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.02
                ),
                decoration: BoxDecoration(
                  color: themeProvider.isDark ?
                  Theme.of(context).cardColor
                      : EventlyColors.whiteBg,
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(
                    color: Theme.of(context).dividerColor,
                    width: 1
                  )
                ),
                child: Text(
                    "21 Jun",
                  style: themeProvider.isDark ?
                      Theme.of(context).textTheme.labelSmall
                      : Theme.of(context).textTheme.titleSmall
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.02
                ),
                decoration: BoxDecoration(
                  color: themeProvider.isDark ?
                  Theme.of(context).cardColor
                      : EventlyColors.whiteBg,
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(
                    color: Theme.of(context).dividerColor,
                    width: 1
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "This is a Sport Event",
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    InkWell(
                      overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
                      onTap: () {
                        widget.isSelected = !widget.isSelected;
                        setState(() {

                        });
                      },
                      child: FaIcon(
                        widget.isSelected ?
                        FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEventTab() {
    Navigator.pushNamed(context, EventlyRoutes.eventDetailsScreen);
  }
}