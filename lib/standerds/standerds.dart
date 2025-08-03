import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

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

showAlertDialog(BuildContext context, String title, String subtitle) {
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    content: Text(
      subtitle,
    ),
    actions: [
      GFButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Ok"),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context, String title, String subtitle,
    Function() confirmFun) {
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    content: Text(
      subtitle,
    ),
    actions: [
      GFButton(
        color: color1,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("NO"),
      ),
      GFButton(
        color: Colors.redAccent,
        onPressed: () {
          confirmFun();
        },
        child: const Text("Yes"),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// ********************** Styles ********************** //
TextStyle titleStyle =
    TextStyle(fontWeight: FontWeight.bold, color: color4, fontSize: 16);

// ********************** Links ********************** //

const String linkServer = "http://192.168.1.18/system"; // Real Device Api
const String linkLogin = "$linkServer/api/auth/login.php";
const String linknews = "$linkServer/api/news.php";
const String linkevents = "$linkServer/api/events.php";

// ********************** Input messages ********************** //

const String messageInputEmpty = "This field cannot be empty";
const String messageInputmin = "This field cannot be less than";
const String messageInputmax = "This field cannot be more than";
const String messageInputReg = "only Letters, numbers, and underscores.";
final alphanumeric = RegExp(r'^[a-zA-Z0-9_]+$');

// ********************** Functions ********************** //

validInput(String val, int min, int max) {
  if (val.isEmpty) {
    return messageInputEmpty;
  }
  if (val.length > max) {
    return "$messageInputmax $max";
  }
  if (val.length < min) {
    return "$messageInputmin $min";
  }
  if (!alphanumeric.hasMatch(val)) {
    return messageInputReg;
  }
}
