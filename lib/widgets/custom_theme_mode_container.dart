import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../utils/dimensions.dart';
import '../utils/evently_colors.dart';

class CustomThemeModeContainer extends StatefulWidget{
  String icon;
  ThemeMode themeMode;
  bool isSelected;

  CustomThemeModeContainer({
    super.key,
    required this.icon,
    required this.themeMode,
    this.isSelected = true
  });

  @override
  State<CustomThemeModeContainer> createState() => _CustomThemeModeContainerState();
}

class _CustomThemeModeContainerState extends State<CustomThemeModeContainer> {
  late  bool isSelected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    var width = context.width;
    var height = context.height;
    return InkWell(
      overlayColor: WidgetStatePropertyAll(EventlyColors.transparent),
      onTap: () {
          themeProvider.changeTheme(widget.themeMode);
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
        child:
        SvgPicture.asset(
          widget.icon,
          colorFilter:
          isSelected ?
          ColorFilter.mode(EventlyColors.white, BlendMode.srcIn) :
          ColorFilter.mode(EventlyColors.mainBlue, BlendMode.srcIn),
        )
      ),
    );
  }
}