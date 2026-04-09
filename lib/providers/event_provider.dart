import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../models/event_model.dart';

class EventProvider extends ChangeNotifier{
  //todo: data
  List <Event> eventsList = [];
  List <String> eventCategory = [];
  List<Event> filterList = [];
  List<Event> favoriteList = [];
  int selectedIndex = 0;

  void getEventsCategory (BuildContext context){
    eventCategory = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
  }


  //todo: methods
  void getAllEventsFromFireStore(String uId) async {
    QuerySnapshot<Event> querySnapShot = await FirebaseUtils.getEventsCollection(uId)
    .orderBy("eventDate")
        .get();
    eventsList = querySnapShot.docs.map((doc) {
        return doc.data();
      },
    ).toList();
    filterList = eventsList;
    notifyListeners();
  }

  void getFilterEventsFromFireStore(String uId) async {
    var querySnapShot = await FirebaseUtils.getEventsCollection(uId)
    .where("category",isEqualTo: eventCategory[selectedIndex])
    .get();
    filterList = querySnapShot.docs.map((doc) {
     return doc.data();
   },).toList();
  notifyListeners();
  }

  Future<void> updateFavorite(Event event,String uId) async {
    FirebaseUtils.getEventsCollection(uId)
        .doc(event.id)
        .update({"isFavorite": !event.isFavorite})
    .then((value) {
      print("Is Favorite Updated Successfully :)");
      selectedIndex == 0
          ? getAllEventsFromFireStore(uId)
          : getFilterEventsFromFireStore(uId);
      getFavoriteEvents(uId);
    },);
    //     .timeout(Duration(milliseconds: 100),onTimeout: (){
    //       print("Is Favorite Updated Successfully :)");
    //       selectedIndex == 0
    //           ? getAllEventsFromFireStore()
    //           : getFilterEventsFromFireStore();
    //       getFavoriteEvents();
    // });
    notifyListeners();
  }

  Future<void> getFavoriteEvents(String uId) async {
    var querySnapShot = await FirebaseUtils.getEventsCollection(uId)
        .orderBy("eventDate")
        .where("isFavorite",isEqualTo: true)
        .get();

    favoriteList = querySnapShot.docs.map((doc) {
      return doc.data();
    },).toList();

    notifyListeners();
  }

  Future<void> deleteEvent(Event event,String uId) async {
    FirebaseUtils.getEventsCollection(uId)
        .doc(event.id)
        .delete()
        .then((value) {
      print("Event Deleted Successfully :)");
    },);
  }

  void changeSelectedIndex(int newIndex,String uId){
    selectedIndex = newIndex;
    selectedIndex == 0 ? getAllEventsFromFireStore(uId) : getFilterEventsFromFireStore(uId);
  }
}