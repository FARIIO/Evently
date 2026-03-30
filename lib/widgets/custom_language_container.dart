import 'package:evently/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  var languageProvider = Provider.of<LanguageProvider>(context);
    var width = context.width;
    var height = context.height;
    return InkWell(
      overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
      onTap: () {
          languageProvider.changeLanguage(widget.langCode);
          isSelected = !isSelected;
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height*0.01
        ),
        decoration: BoxDecoration(
          color: isSelected ?
          EventlyColors.mainBlue :
          EventlyColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.language,
          style:  isSelected ?
          Theme.of(context).textTheme.labelSmall :
          Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}