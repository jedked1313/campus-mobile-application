import 'package:flutter/material.dart';
import 'package:flutter_p/standerds/standerds.dart';

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
          Column(
            children: events.entries.map((data) {
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
                        Text(
                            style: const TextStyle(fontSize: 12),
                            "Date : ${data.value}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.key)
                  ],
                ),
              );
            }).toList(),
          )
        ]));
  }
}

const Map<String, String> events = {
  "Beginning of the second semester": "2022/8/27",
  "End of the second semester": "2022/11/17",
  "Beginning of the second semester exams": "2022/12/3",
  "End of the second semester exams": "2022/12/22",
  "Announcing the results of the second semester": "2023/1/4",
};
