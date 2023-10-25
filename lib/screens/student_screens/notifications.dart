import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class Notifications extends StatelessWidget {
  static String title = "Notifications";
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: ListView(
          shrinkWrap: true,
          children: [
            _createContent(
                "assets/icon/user1.svg",
                "Teacher 1",
                "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                "First Notice",
                'Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
            _createContent("assets/icon/user1.svg", "Teacher 2", "2022-10-10",
                "title", "Hello World"),
            _createContent("assets/icon/user1.svg", "Teacher 3", "2022-10-10",
                "title2", "Hello World2")
          ],
        ),
      ),
    );
  }
}

_createContent(
    String svgURL, String name, dynamic date, String title, String content) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1, color: Colors.grey),
    ),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
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
                      svgURL, // Image of Sender
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        name, // Name of notice sender
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        date, // Date of notice
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title, // Title of notice
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 25),
            // Content of message
            child: ReadMoreText(
              content,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\nShow more',
              trimExpandedText: '\nShow less',
              lessStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueAccent),
              moreStyle: const TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
