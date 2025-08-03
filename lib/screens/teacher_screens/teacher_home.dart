import 'package:flutter/material.dart';
import 'package:campus_mobile_application/screens/sidebar.dart';
import 'package:campus_mobile_application/standerds/standerds.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import '../../state management/my_provider.dart';
import '../student_screens/news.dart';
import 'send_messages.dart';
import 'upload_lectures.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const Sidebar(),
      body: Column(
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
                            builder: (context) => Scaffold(
                                  appBar: AppBar(title: const Text("News")),
                                  body: const News(),
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                            offset: const Offset(-3, 2))
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset(url, fit: BoxFit.cover, width: 1000.0),
                    ),
                  ),
                );
              },
            ).toList(),
            onPageChanged: (index) {
              Provider.of<MyProvider>(context, listen: false)
                  .changeSlide(index);
            },
          ),
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: myList.map((data) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => data.onPressed));
                  },
                  splashColor: color1,
                  child: Ink(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          spreadRadius: 0.5,
                          blurRadius: 2 * 2,
                          offset: const Offset(0, 2))
                    ], color: color1, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: SvgPicture.asset(
                              data.icon,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList()),
        ],
      ),
    );
  }
}

final List<String> imageList = [
  // List of Carousel Images
  'assets/image/slider_1.jpg',
  'assets/image/slider_2.jpg',
  'assets/image/slider_3.jpg',
];
final List<Screens> myList = [
  // List of Screens
  screens1,
  screens2,
  screens3,
  screens4,
];
final Screens screens1 = Screens(
  title: "Send Message",
  icon: "assets/icon/sendmessage.svg",
  onPressed: const SendMessages(),
);
final Screens screens2 = Screens(
  title: "Upload Lecture",
  icon: "assets/icon/upload.svg",
  onPressed: const UploadLectures(),
);
final Screens screens3 = Screens(
  title: "My Messages",
  icon: "assets/icon/message2.svg",
  onPressed: const UploadLectures(),
);
final Screens screens4 = Screens(
  title: "News",
  icon: "assets/icon/news.svg",
  onPressed: Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: const News()),
);

class Screens {
  final String title;
  final Widget onPressed;
  final String icon;
  Screens({required this.title, required this.onPressed, required this.icon});
}
