import 'package:flutter/material.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../../state management/my_provider.dart';

class Lectures extends StatelessWidget {
  static String title = "Lectures";
  const Lectures({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          Lectures.title,
          style: titleStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Image.asset(
            "assets/image/lectures.jpg",
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
                          builder: (context) => ViewLectures(
                              title: Provider.of<MyProvider>(context,
                                      listen: false)
                                  .dropdownValue)));
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

class ViewLectures extends StatelessWidget {
  const ViewLectures({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return _createLec(index + 1);
          }),
          itemCount: 12,
        ),
      ),
    );
  }
}

_createLec(i) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: InkWell(
      highlightColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  Icons.library_books_rounded,
                  color: Colors.white,
                ),
              ),
              Text("Lecture $i"),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(25)),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              )
            ],
          )),
    ),
  );
}
