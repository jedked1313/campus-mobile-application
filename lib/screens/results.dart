import 'package:flutter/material.dart';
import 'package:flutter_p/standerds/standerds.dart';
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
        title: Text(Results.title),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Image.asset("assets/image/results.jpg",
              height: MediaQuery.of(context).size.height * 0.3),
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
              onPressed: () {
                dropdownValue == null
                    ? ScaffoldMessenger.of(context)
                        .showSnackBar(showToast("Year"))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsDetails(
                                  title: dropdownValue,
                                )));
              },
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
    );
  }
}

class ResultsDetails extends StatelessWidget {
  const ResultsDetails({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title Year Grades",
          style: const TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DataTable(
              decoration: BoxDecoration(
                  color: Standerds.color1.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Standerds.color1)),
              // headingRowColor: MaterialStateProperty.all(Colors.green),
              columnSpacing: 0,
              dataRowHeight: 70,
              dataTextStyle: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              columns: const [
                DataColumn(
                    label: Expanded(
                        child: Text(
                  "Subject",
                  textAlign: TextAlign.center,
                ))),
                DataColumn(
                    label: Expanded(
                        child: Text(
                  "Grade",
                  textAlign: TextAlign.center,
                ))),
              ],
              rows: grades.entries.map((data) {
                return DataRow(cells: [
                  DataCell(Center(
                    child: Text(
                      data.key,
                    ),
                  )),
                  DataCell(Center(
                    child: Text(
                      data.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  )),
                ]);
              }).toList()),
        ),
      ]),
    );
  }
}

const grades = {
  "C++": "A+",
  "Java": "A+",
  "Programming Basics": "B+",
  "Data Structures": "B+",
  "Artificial Intelligence": "B+",
  "Internet of Things": "C+",
};
