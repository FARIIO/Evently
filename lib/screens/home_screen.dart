import 'package:evently/tabs/favorite/favorite_tab.dart';
import 'package:evently/tabs/home/home_tab.dart';
import 'package:evently/tabs/profile/profile_tab.dart';
import 'package:evently/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget{
  int newIndex = 0;
  List<Widget> tabsList = [
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(newIndex: newIndex,),
      body: tabsList[newIndex],
    );
  }

}