import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatelessWidget {
  static String title = "Notifications";
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.centerLeft, colors: [
                        Colors.blueAccent.shade200,
                        Colors.blueAccent.shade400,
                      ]),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icon/user1.svg",
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Khider Abdo",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Text(
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "First Notice",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 25),
                    child: Text(
                      "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet  Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
