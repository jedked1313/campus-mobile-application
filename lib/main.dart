import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p/screens/lecture.dart';
import 'package:flutter_p/screens/results.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:flutter_p/widgets/sidebar.dart';
import 'screens/home.dart';
import 'screens/news.dart';

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
        fontFamily: "Raleway",
        primarySwatch: Standerds.customWhite,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
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
        // leading: IconButton(
        //   icon: Icon(Icons.menu_book_outlined),
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        // ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(pageTitle),
      ),
      drawer: const Sidebar(),
      body: screensPages[selectedScreen],
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: DotNavigationBar(
            enablePaddingAnimation: false,
            backgroundColor: Standerds.color4,
            dotIndicatorColor: Colors.white,
            curve: Curves.decelerate,
            paddingR: const EdgeInsets.all(7),
            marginR: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            currentIndex: selectedScreen,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                selectedScreen = index;
                pageTitle = names[index];
              });
            },
            items: [
              DotNavigationBarItem(
                  icon: const Icon(
                Icons.home,
                size: 25,
              )),
              DotNavigationBarItem(
                  icon: const Icon(
                Icons.notifications,
                size: 25,
              )),
              DotNavigationBarItem(
                  icon: const Icon(
                Icons.account_circle,
                size: 25,
              )),
              DotNavigationBarItem(
                  icon: const Icon(
                Icons.newspaper,
                size: 25,
              )),
            ]),
      ),
    );
  }
}

List names = [HomePage.title, Lectures.title, Results.title, News.title];
List<Widget> screensPages = [
  const HomePage(),
  const Lectures(),
  const Results(),
  const News()
];
