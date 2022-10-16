import 'package:flutter/material.dart';
import 'package:flutter_p/screens/Time_table.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_svg/svg.dart';
import 'calender.dart';
import 'lecture.dart';
import 'results.dart';

class HomePage extends StatefulWidget {
  static String title = "Home";
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GFCarousel(
          enlargeMainPage: true,
          autoPlay: true,
          pagerSize: 10,
          aspectRatio: 16 / 8,
          activeIndicator: Colors.white,
          activeDotBorder: Border.all(width: 1),
          hasPagination: true,
          items: imageList.map(
            (url) {
              return InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const News()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2 * 2,
                          offset: const Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(url, fit: BoxFit.cover, width: 1000.0),
                  ),
                ),
              );
            },
          ).toList(),
          onPageChanged: (index) {
            setState(() {
              index;
            });
          },
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height < 700 ? 10 : 20),
        ),
        GridView.count(
          
            shrinkWrap: true,
            childAspectRatio: 1.41, // Size of Cards
            crossAxisCount: 2,
            padding: const EdgeInsets.only(left: 16, right: 16),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: myList.map((data) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => data.onPressed));
                },
                splashColor: Standerds.color1,
                child: Ink(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 2 * 2,
                            offset: const Offset(0, 2))
                      ],
                      color: Standerds.color1,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        data.icon,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.title,
                        style: const TextStyle(
                            color: Color.fromRGBO(70, 147, 153, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ],
    );
  }
}

final List<Screens> myList = [
  // List of Screens
  screens1,
  screens2,
  screens3,
  screens4,
  screens5,
  screens6
];
final List<String> imageList = [
  // List of Carousel Images
  'assets/image/slider_1.jpg',
  'assets/image/slider_2.jpg',
  'assets/image/slider_3.jpg',
];

// Grid Items
final Screens screens1 = Screens(
  title: "Lectures",
  icon: "assets/icon/lecture.svg",
  onPressed: const Lectures(),
);
final Screens screens2 = Screens(
  title: "Time Table",
  icon: "assets/icon/calendar1.svg",
  onPressed: const TimeTable(),
);
final Screens screens3 = Screens(
  title: "Calendar",
  icon: "assets/icon/calendar2.svg",
  onPressed: const Calender(),
);
final Screens screens4 = Screens(
  title: "Results",
  icon: "assets/icon/result2.svg",
  onPressed: const Results(),
);
final Screens screens5 = Screens(
  title: "ToDo List",
  icon: "assets/icon/homework1.svg",
  onPressed: const Lectures(),
);
final Screens screens6 = Screens(
  title: "ID Card",
  icon: "assets/icon/id3.svg",
  onPressed: const Lectures(),
);

class Screens {
  final String title;
  final Widget onPressed;
  final String icon;
  Screens({required this.title, required this.onPressed, required this.icon});
}
