import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:campus_mobile_application/screens/teacher_screens/teacher_home.dart';
import 'package:campus_mobile_application/state management/my_provider.dart';
import 'package:campus_mobile_application/screens/splash.dart';
import 'package:campus_mobile_application/standerds/standerds.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // brightness: Brightness.dark, // Enable Dark Mode
            fontFamily: "Poppins", // App Font
            primarySwatch: customWhite,
            appBarTheme: AppBarTheme(
              shadowColor: Colors.transparent,
              titleTextStyle: titleStyle,
              centerTitle: true,
            ),
            splashFactory: NoSplash.splashFactory, // disable splash color
            canvasColor: Colors.white),
        home: sharedPref.getString("id") == null
            ? const Spalsh()
            : (sharedPref.getString("isTeacher") == "1"
                ? const TeacherHome()
                : const Home()));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          Provider.of<MyProvider>(context).pageTitle,
          style: titleStyle,
        ),
      ),
      drawer: const Sidebar(),
      body: Provider.of<MyProvider>(context).screensPages[
          Provider.of<MyProvider>(context, listen: false).selectedScreen],
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                spreadRadius: 0.5,
                blurRadius: 4,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(15),
          color: color1,
        ),
        child: GNav(
            gap: 5,
            backgroundColor: color1,
            color: Colors.white, // color of icons
            activeColor: Colors.white, // color of active icon
            tabBorder: Border.all(width: 1.3, color: Colors.transparent),
            tabBackgroundColor: color2,
            tabActiveBorder: Border.all(
                color: const Color.fromRGBO(70, 147, 153, 1), width: 1.3),
            textStyle: const TextStyle(
                fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
            onTabChange: (index) {
              Provider.of<MyProvider>(context, listen: false)
                  .changeScreen(index);
            },
            tabs: const [
              GButton(
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 5),
                icon: CupertinoIcons.home,
                text: "Home",
              ),
              GButton(
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 5),
                icon: CupertinoIcons.text_bubble_fill,
                text: "Notification",
              ),
              GButton(
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 5),
                icon: CupertinoIcons.news_solid,
                text: "News",
              ),
              GButton(
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 5),
                icon: CupertinoIcons.settings,
                text: "Setting",
              ),
            ]),
      ),
    );
  }
}
