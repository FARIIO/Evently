import 'package:evently/cache/cache_helper.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/utils/evently_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../utils/dimensions.dart';
import '../utils/evently_colors.dart';

class CustomLanguageContainer extends StatefulWidget{
  String language;
  String langCode;
  bool isSelected;

  CustomLanguageContainer({
    super.key,
    required this.language,
    required this.langCode,
    this.isSelected = true
  });

  @override
  State<CustomLanguageContainer> createState() => _CustomLanguageContainerState();
}

class _CustomLanguageContainerState extends State<CustomLanguageContainer> {
  late bool isSelected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.isSelected;
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    var width = context.width;
    var height = context.height;
    return InkWell(
      overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
      onTap: () async {
          languageProvider.changeLanguage(widget.langCode);
          isSelected = !isSelected;
          await CacheHelper.setData(key: "language_selected", value: widget.langCode);
          debugPrint("language selected is : ${CacheHelper.getData(key: "language_selected")}");
          setState(() {

          });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height*0.01
        ),
        decoration:
        themeProvider.isDark?
        BoxDecoration(
          color: isSelected ?
          EventlyTheme.darkTheme.cardColor :
          EventlyTheme.darkTheme.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(
            color: EventlyTheme.darkTheme.dividerColor,
             width: 1.5
          )
        ) :
        BoxDecoration(
          color: isSelected ?
          EventlyColors.mainBlue :
          EventlyColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.language,
          style: isSelected
              ? Theme.of(context).textTheme.labelSmall
              : Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}