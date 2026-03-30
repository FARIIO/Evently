import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.getStarted),
      ),
    );
  }

}