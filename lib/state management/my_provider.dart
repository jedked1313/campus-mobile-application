import "package:flutter/material.dart";
import 'package:flutter_p/screens/student_screens/setting.dart';
import '../screens/student_screens/home.dart';
import '../screens/student_screens/news.dart';
import '../screens/student_screens/notifications.dart';

class MyProvider with ChangeNotifier {
  int selectedScreen = 0;
  String pageTitle = "Home";
  dynamic dropdownValue;
  dynamic dropdownValue2;
  dynamic dropdownValue3;

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
    dropdownValue2 = null;
    notifyListeners();
  }

  dropdownValueSet2(dynamic value) {
    dropdownValue2 = value;
    notifyListeners();
  }

  dropdownValueSet3(dynamic value) { // for Upload lecture screen "Dumb way but at least work"
    dropdownValue3 = value;
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
