import 'package:flutter/material.dart';
import 'package:flutter_p/state%20management/my_provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import '../../standerds/standerds.dart';
// import 'package:http/http.dart' as http;

class Attendance extends StatelessWidget {
  static String title = "Attendance";

  const Attendance({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Attendance.title, style: titleStyle),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Image.asset(
            "assets/image/attendance.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Text(
            "Select the Subject",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20),
            child: DropdownButtonHideUnderline(
              child: GFDropdown(
                icon: const Icon(Icons.expand_circle_down_outlined),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                borderRadius: BorderRadius.circular(10),
                isDense: false,
                border: const BorderSide(color: Colors.black12, width: 1),
                dropdownButtonColor: Colors.grey[300],
                value: Provider.of<MyProvider>(context).dropdownValue,
                onChanged: (newValue) {
                  Provider.of<MyProvider>(context, listen: false)
                      .dropdownValueSet(newValue);
                },
                items: sub.keys
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          GFButton(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            onPressed: () {
              Provider.of<MyProvider>(context, listen: false).dropdownValue ==
                      null
                  ? ScaffoldMessenger.of(context)
                      .showSnackBar(showToast("Subject"))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceDetails(
                                title: Provider.of<MyProvider>(context,
                                        listen: false)
                                    .dropdownValue,
                              )));
            },
            color: const Color.fromRGBO(224, 224, 224, 1),
            borderSide: const BorderSide(color: Colors.black12, width: 1),
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class AttendanceDetails extends StatelessWidget {
  final String title;
  const AttendanceDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Map<String, bool>? details = sub[title];
    int totalPresent = 0;
    int totalAbsent = 0;
    for (int i = 0; i < details!.values.length; i++) {
      if (details.values.toList()[i] == true) {
        totalPresent += 1;
      } else {
        totalAbsent += 1;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: titleStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top + kToolbarHeight) -
                MediaQuery.of(context).size.height * 0.19,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: details.entries.map((subject) {
                    return ListTile(
                      style: ListTileStyle.drawer,
                      leading: subject.value == true
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.greenAccent,
                            )
                          : const Icon(
                              Icons.cancel_rounded,
                              color: Colors.redAccent,
                            ),
                      title: subject.value == true
                          ? const Text("Present")
                          : const Text("Absent"),
                      subtitle: Text("Date : ${subject.key}"),
                    );
                  }).toList()),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Total Present",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$totalPresent",
                          style: const TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.fromLTRB(5, 0, 10, 5),
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Total Absent",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$totalAbsent",
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Map<String, Map<String, bool>> sub = {
  'OOP': {
    "2022-12-1": true,
    "2022-12-2": false,
    "2022-12-13": true,
    "2022-12-4": false,
    "2022-12-5": true,
    "2022-12-6": true,
  },
  'Artificial Intelligence': {
    "2022-12-1": true,
    "2022-12-2": true,
    "2022-12-3": true,
    "2022-10-1": false,
    "2022-11-2": true,
  },
  'Internet of Things': {
    "2022-12-2": false,
    "2022-11-1": true,
    "2022-12-1": false,
    "2022-9-1": false,
    "2022-10-1": true,
  },
  'Programming Basics': {
    "2022-12-1": false,
    "2022-4-1": false,
    "2022-12-2": false,
    "2022-2-1": true,
    "2022-3-1": true,
  },
  'Data Structures': {
    "2022-12-2": true,
    "2022-12-1": true,
    "2022-5-1": true,
    "2022-6-1": false,
    "2022-7-1": false,
  },
};
