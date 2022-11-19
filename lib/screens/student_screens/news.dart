import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../standerds/standerds.dart';

// ignore: must_be_immutable
class News extends StatelessWidget {
  static String title = "News";
  AppBar? _appBar;
  News({Key? key, AppBar? appBar})
      : _appBar = appBar,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar == null
          ? null
          : _appBar = AppBar(
              title: Text(
                "News",
                style: titleStyle,
              ),
            ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient:
                          LinearGradient(begin: Alignment.centerLeft, colors: [
                        Colors.blueAccent.shade200,
                        Colors.blueAccent.shade400,
                      ]),
                      border: Border.all(
                          width: 1, color: Colors.blueAccent.shade200)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/image/slider_1.jpg",
                              fit: BoxFit.cover,
                              width: 110,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date : ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Report 1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            ReadMoreText(
                              "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet",
                              trimLines: 3,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '\nShow More',
                              trimExpandedText: '\nShow Less',
                              lessStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                              moreStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class NewsData {
  final String title;
  final String subTitle;
  final String image;

  NewsData({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
