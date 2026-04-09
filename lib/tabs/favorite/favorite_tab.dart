import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/tabs/favorite/widgets/search_form_field.dart';
import 'package:evently/tabs/home/widgets/event_item.dart';
import 'package:evently/utils/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';

class FavoriteTab extends StatefulWidget{
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late EventProvider eventProvider;
  late UserProvider userProvider;

  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    eventProvider.getFavoriteEvents(userProvider.currentUser!.id);
    },);
  }
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    eventProvider = Provider.of<EventProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
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
            spacing: height * 0.02,
            children: [
              SearchFormField(
                isSuffix: true,
                hintText: AppLocalizations.of(context)!.searchForEvent,
                validator: (value){
                  return null;
                },
              ),
              Expanded(
                child:
                eventProvider.favoriteList.isEmpty ?
                    Center(
                      child: Text(
                          "No Favorite Events !",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                    :
                ListView.separated(
                    itemBuilder: (context, index) {
                      return EventItem(event: eventProvider.favoriteList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.01,);
                    },
                    itemCount: eventProvider.favoriteList.length
                ),
              ),
            ],
          )
                ),
              )
    );
  }

}