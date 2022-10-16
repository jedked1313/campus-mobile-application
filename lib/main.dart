import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p/screens/lecture.dart';
import 'package:flutter_p/screens/profile.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:flutter_p/widgets/sidebar.dart';
import 'screens/home.dart';
import 'screens/news.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "University app",
      theme: ThemeData(
        // brightness: Brightness.dark, // Enable Dark Mode
        fontFamily: "Raleway", // App Font
        primarySwatch: Standerds.customWhite,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory, // disable splash color
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedScreen = 0;
  String pageTitle = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(pageTitle),
      ),
      drawer: const Sidebar(),
      body: screensPages[selectedScreen],
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 2 * 2,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 177, 219, 223),
        ),
        child: GNav(
            gap: 5,
            backgroundColor: const Color.fromARGB(255, 177, 219, 223),
            color: Colors.white, // color of icons
            activeColor: Colors.white, // color of active icon
            tabBorder: Border.all(width: 1.3, color: Colors.transparent),
            tabBackgroundColor: Standerds.color1,
            tabActiveBorder: Border.all(
                color: const Color.fromRGBO(70, 147, 153, 1), width: 1.3),
            textStyle: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(70, 147, 153, 1),
                fontWeight: FontWeight.bold),
            onTabChange: (index) {
              setState(() {
                selectedScreen = index; // change the screen
                pageTitle = names[index]; // change the title of screen
              });
            },
            tabs: const [
              GButton(
                padding: EdgeInsets.all(8),
                icon: CupertinoIcons.home,
                text: "Home",
              ),
              GButton(
                padding: EdgeInsets.all(8),
                icon: CupertinoIcons.mail_solid,
                text: "Notification",
              ),
              GButton(
                padding: EdgeInsets.all(8),
                icon: CupertinoIcons.person_crop_circle_fill,
                text: "Profile",
              ),
              GButton(
                padding: EdgeInsets.all(8),
                icon: CupertinoIcons.news_solid,
                text: "News",
              ),
            ]),
      ),
    );
  }
}

List names = [HomePage.title, Lectures.title, Profile.title, News.title];
List<Widget> screensPages = [
  const HomePage(),
  const Lectures(),
  const Profile(),
  const News()
];
