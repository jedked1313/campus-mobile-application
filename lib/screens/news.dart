import 'package:flutter/material.dart';

class News extends StatelessWidget {
  static String title = "News";
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: const Color.fromARGB(255, 201, 201, 201),
                  ),
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
                            "Date : ${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Report 1"),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            InkWell(
                              child: const Text(
                                "Read More...",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 110, 199),
                                    fontSize: 12),
                              ),
                              onTap: () {},
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
