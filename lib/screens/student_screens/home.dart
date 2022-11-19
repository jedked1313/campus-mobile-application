import 'package:flutter/material.dart';
import 'package:flutter_p/screens/student_screens/time_table.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:flutter_p/state%20management/my_provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'attendance.dart';
import 'calender.dart';
import 'lecture.dart';
import 'news.dart';
import 'results.dart';

class HomePage extends StatelessWidget {
  static String title = "Home";

  const HomePage({super.key});
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => News(
                                appBar: AppBar(),
                              )));
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
            Provider.of<MyProvider>(context, listen: false).changeSlide(index);
          },
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height < 700 ? 10 : 25),
        ),
        GridView.count(
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.height > 750
                ? 1.39
                : 1.41, // Size of Cards
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
                splashColor: color1,
                child: Ink(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 2 * 2,
                        offset: const Offset(0, 2))
                  ], color: color1, borderRadius: BorderRadius.circular(10)),
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
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
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
  title: "Attendance",
  icon: "assets/icon/attendance.svg",
  onPressed: const Attendance(),
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
