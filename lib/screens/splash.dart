import 'package:flutter/material.dart';
import 'package:flutter_p/screens/login.dart';
import 'package:intro_slider/intro_slider.dart';

class Spalsh extends StatelessWidget {
  const Spalsh({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContentConfig> listContent = [
      // List Of content
      _createContent(
          "Take a look at the news and check your notifications",
          "assets/image/splash1.png",
          const Color.fromRGBO(43, 121, 230, 1),
          context),
      _createContent(
          "An easy way to get and download your lectures",
          "assets/image/splash2.png",
          const Color.fromRGBO(183, 223, 234, 1),
          context),
      _createContent(
          "Look at your results and see how the progress goes",
          "assets/image/splash3.png",
          const Color.fromRGBO(255, 187, 187, 1),
          context),
    ];
    return IntroSlider(
        isShowSkipBtn: false,
        listContentConfig: listContent,
        onDonePress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        });
  }

  ContentConfig _createContent(
      String description, String imageAssets, Color backgroundColor, context) {
    return ContentConfig(
      title: "Campus Mobile App",
      styleTitle: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.060,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      description: description,
      styleDescription: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.060),
      pathImage: imageAssets,
      heightImage: MediaQuery.of(context).size.height / 3.3,
      backgroundColor: backgroundColor,
    );
  }
}
