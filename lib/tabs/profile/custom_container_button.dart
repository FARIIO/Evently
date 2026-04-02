import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/dimensions.dart';
import '../../utils/evently_colors.dart';

class CustomContainerButton extends StatelessWidget{
    String title;
    Widget suffix;
    double paddingWidth;
    double paddingHeight;
   CustomContainerButton({
     super.key,
     required this.title,
     required this.suffix,
     required this.paddingHeight,
     required this.paddingWidth
   });


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingWidth,
          vertical: paddingHeight
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: BoxBorder.all(
              color: Theme.of(context).dividerColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            suffix
          ],
        ),
      ),
    );
  }

}