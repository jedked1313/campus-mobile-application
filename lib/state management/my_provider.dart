import "package:flutter/material.dart";
import 'package:flutter_p/screens/setting.dart';
import '../screens/home.dart';
import '../screens/news.dart';
import '../screens/notifications.dart';

class MyProvider with ChangeNotifier {
  int selectedScreen = 0;
  String pageTitle = "Home";
  dynamic dropdownValue;

  changeScreen(int index) {
    selectedScreen = index; // change the screen
    pageTitle = names[index]; // change the title of screen
    notifyListeners();
  }

  int changeSlide(int index) {
    return index;
  }

  dropdownValueSet(dynamic value) {
    dropdownValue = value;
    notifyListeners();
  }

  List names = [HomePage.title, Notifications.title, News.title, Setting.title];
  List<Widget> screensPages = [
    const HomePage(),
    const Notifications(),
    News(),
    const Setting(),
  ];
}
