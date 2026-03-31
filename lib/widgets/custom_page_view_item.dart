import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/evently_colors.dart';
import 'package:evently/utils/evently_images.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../providers/theme_provider.dart';
import '../utils/dimensions.dart';

class CustomPageViewItem extends StatelessWidget{
  String pageViewImage;
  String title;
  String description;
  PageController controller;
  int index;

  CustomPageViewItem({
    super.key,
    required this.pageViewImage,
    required this.title,
    required this.description,
    required this.controller,
    required this.index
  });
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = context.width;
    var height = context.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height*0.01
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  index > 0
                      ? Expanded(
                    child: Container(
                      padding: EdgeInsetsGeometry.symmetric(
                      ),
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
                            controller.previousPage(
                                duration: Duration(
                                    milliseconds: 500),
                                curve: Curves.easeIn
                            );
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
                  )
                      : Expanded(child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                        EventlyImages.evently
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
                      onTap: () {
                        controller.jumpToPage(3);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width*0.04,
                            vertical: height*0.02
                        ),
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
                        child: Text(
                          AppLocalizations.of(context)!.skip,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: Image.asset(pageViewImage)),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height*0.02
                ),
                child: Center(
                  child: SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotHeight: height*0.012,
                      dotWidth: width * 0.024,
                      dotColor:
                      themeProvider.isDark
                        ? EventlyColors.white
                        : EventlyColors.greyDisable,
                      activeDotColor:
                      themeProvider.isDark
                        ? Theme.of(context).primaryColor
                        : EventlyColors.mainBlue
                    ),
                      controller: controller,
                      count: 3
                  ),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start,
              ),
              Text(
                  description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomElevatedButton(
                index: index == 2 ? 2 : index,
                title: index == 2
                    ? AppLocalizations.of(context)!.getStarted
                    : AppLocalizations.of(context)!.next,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}