import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calender",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Today's date : ${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          DataTable(
            dataRowHeight: 80,
            dataTextStyle: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            headingTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
            columns: const [
              DataColumn(
                  label: Expanded(
                      child: Text(
                "التاريخ",
                textAlign: TextAlign.center,
              ))),
              DataColumn(
                  label: Expanded(
                      child: Text(
                "البند",
                textAlign: TextAlign.center,
              ))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Center(child: Text("2022/12/3"))),
                DataCell(Center(
                  child: Text(
                    "بداية إمتحانات الفصل الثاني",
                  ),
                )),
              ]),
              DataRow(cells: [
                DataCell(Center(child: Text("2022/12/22"))),
                DataCell(Center(
                  child: Text(
                    "نهاية إمتحانات الفصل الثاني",
                  ),
                )),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
