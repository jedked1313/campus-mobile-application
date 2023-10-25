import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:http/http.dart' as http;

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calender",
            style: titleStyle,
          ),
        ),
        body: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Today's date : ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: _fetchEvents(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, index) {
                        return _createEvents(
                            snapshot.data[index]["dates"].toString(),
                            snapshot.data[index]["events"]);
                      }));
                }
              })),
        ]));
  }
}

_createEvents(String date, String title) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: color1.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: color1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Event Name",
              style: TextStyle(fontSize: 12),
            ),
            Text(style: const TextStyle(fontSize: 12), "Date : $date"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title)
      ],
    ),
  );
}

Future _fetchEvents() async {
  var res = await http.get(Uri.parse(linkevents));
  if (res.statusCode == 200) {
    var obj = jsonDecode(res.body);
    return obj;
  }
}
