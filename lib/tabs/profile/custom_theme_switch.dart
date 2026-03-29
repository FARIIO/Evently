import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class CustomThemeSwitch extends StatefulWidget{
  @override
  State<CustomThemeSwitch> createState() => _CustomThemeSwitchState();
}

class _CustomThemeSwitchState extends State<CustomThemeSwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Switch(
      value: switchValue,
      onChanged: (value) {
        setState(() {
          switchValue = value;
          value == true
              ? themeProvider.changeTheme(ThemeMode.dark)
              : themeProvider.changeTheme(ThemeMode.light);
        });
      },
    );
  }
}