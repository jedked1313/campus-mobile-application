import 'package:flutter/material.dart';

class Standerds {
  // ********************** Colors ********************** //
  static MaterialColor customWhite = const MaterialColor(0xFFFFFFFF, {
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
  static Color color1 = const Color.fromRGBO(0, 126, 167, 1);
  static Color color2 = const Color.fromRGBO(0, 168, 232, 1);
  static Color color3 = const Color.fromRGBO(0, 52, 89, 1);
  static Color color4 = const Color.fromRGBO(0, 23, 31, 1);
}

// ********************** Widgets ********************** //
showToast(title) {
  return SnackBar(
    content: Text(
      "Select the $title !",
      style: const TextStyle(color: Colors.black),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Standerds.color1,
  );
}
