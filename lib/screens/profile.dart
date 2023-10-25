import 'package:flutter/material.dart';
import 'package:flutter_p/main.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  static String title = "Profile";
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.23,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              width: 1.5,
                              color: Colors.white,
                              style: BorderStyle.solid)),
                      child: SvgPicture.asset(
                        "assets/icon/user1.svg",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  Text(
                    sharedPref.getString("username").toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20),
            child: Text(
              "Personal Details",
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                setData(Icons.book, "Academic Specialization",
                    UserInfo.specialization),
                setData(Icons.calendar_month_rounded, "Academic Year",
                    UserInfo.year),
                setData(Icons.mail, "Email", UserInfo.email),
                setData(
                    Icons.phone_android_outlined, "Mobile", UserInfo.mobile),
                setData(Icons.telegram, "Telegram", UserInfo.mobile),
                setData(Icons.facebook, "Facebook",
                    "www.facebook.com/${UserInfo.account}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserInfo {
  static String specialization = "Information Technology";
  static String year = "Fourth";
  static String email = "Test@gmail.com";
  static int mobile = 0903204923;
  static String account = "@test123";
}

Widget setData(IconData icon, String label, dynamic inputField) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1, color: Colors.grey.shade400))),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: color1, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "$inputField",
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
