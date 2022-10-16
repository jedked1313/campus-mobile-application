import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Lectures extends StatefulWidget {
  static String title = "Lectures";
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  dynamic dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Text(
            "Lectures",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 120,
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
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: [
                  'OOP',
                  'Artificial Intelligence',
                  'Internet of Things',
                  'Programming Basics',
                  'Data Structures'
                ]
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
          SizedBox(
            width: 150,
            child: GFButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Home()));
              },
              color: const Color.fromRGBO(224, 224, 224, 1),
              borderSide: const BorderSide(color: Colors.black12, width: 1),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
