import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Results extends StatefulWidget {
  final String? selectedYear;
  static String title = "Results";

  const Results({Key? key, this.selectedYear}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  dynamic dropdownValue;
  final List<String> year = ["First", "Second", "Third", "Fourth"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      ),
      body: Container(
        color: const Color.fromARGB(255, 243, 243, 243),
        child: Column(
          children: [
            const Text(
              "Results",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 120,
            ),
            const Text(
              "Select the Year",
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
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Colors.grey[300],
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: ['First', 'Second', 'Third', 'Fourth']
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
                onPressed: () {},
                color: const Color.fromRGBO(224, 224, 224, 1),
                borderSide: const BorderSide(color: Colors.black26, width: 1),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultsDetails extends StatelessWidget {
  const ResultsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
