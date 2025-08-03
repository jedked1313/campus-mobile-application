import 'package:flutter/material.dart';
import 'package:campus_mobile_application/api/requests.dart';
import 'package:readmore/readmore.dart';
import '../../standerds/standerds.dart';

// ignore: must_be_immutable
class News extends StatelessWidget {
  static String title = "News";

  const News({super.key});

  @override
  Widget build(BuildContext context) {
    Requests req = Requests();
    return FutureBuilder(
        future: req.getRequest(linknews),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return _createNew(
                      snapshot.data[index]["photos"],
                      snapshot.data[index]["created_at"],
                      snapshot.data[index]["title"],
                      snapshot.data[index]["details"]);
                }));
          }
        }));
  }

  _createNew(String imageName, String date, String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.blueAccent.shade200,
            Colors.blueAccent.shade400,
          ]),
          border: Border.all(width: 1, color: Colors.blueAccent.shade200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  "$linkServer/public/$imageName",
                  fit: BoxFit.cover,
                  width: 110,
                  height: 80,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Date : $date",
                style: const TextStyle(fontSize: 10, color: Colors.white),
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
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(
                  height: 3,
                ),
                ReadMoreText(
                  content,
                  trimLines: 3,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '\nShow More',
                  trimExpandedText: '\nShow Less',
                  lessStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                  moreStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Future _fetchNews() async {
//   var res = await http.get(Uri.parse(linknews));
//   if (res.statusCode == 200) {
//     var obj = jsonDecode(res.body);
//     return obj;
//   }
// }
