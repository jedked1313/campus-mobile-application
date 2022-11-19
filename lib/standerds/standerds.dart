import 'package:flutter/material.dart';

// ********************** Colors ********************** //
MaterialColor customWhite = const MaterialColor(0xFFFFFFFF, {
  50: Color.fromARGB(255, 250, 250, 250),
  100: Color.fromARGB(255, 250, 250, 250),
  200: Color.fromARGB(255, 250, 250, 250),
  300: Color.fromARGB(255, 250, 250, 250),
  400: Color.fromARGB(255, 250, 250, 250),
  500: Color.fromARGB(255, 250, 250, 250),
  600: Color.fromARGB(255, 250, 250, 250),
  700: Color.fromARGB(255, 250, 250, 250),
  800: Color.fromARGB(255, 250, 250, 250),
  900: Color.fromARGB(255, 250, 250, 250),
});
Color color1 = const Color.fromRGBO(0, 126, 167, 1);
Color color2 = const Color.fromRGBO(0, 168, 232, 1);
Color color3 = const Color.fromRGBO(0, 52, 89, 1);
Color color4 = const Color.fromRGBO(0, 23, 31, 1);

// ********************** Widgets ********************** //
SnackBar showToast(title) {
  return SnackBar(
    content: Text(
      "Choose the $title !",
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: color1,
  );
}

// ********************** Styles ********************** //
TextStyle titleStyle =
    TextStyle(fontWeight: FontWeight.bold, color: color4, fontSize: 16);
