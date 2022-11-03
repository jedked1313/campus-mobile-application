import 'package:flutter/material.dart';
import '../standerds/standerds.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: titleStyle,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DataTable(
            dataRowHeight: 70,
            showBottomBorder: true,
            rows: const [
              DataRow(cells: [
                DataCell(Text("Saturday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("Sunday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("Monday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("Tuesday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("Wednesday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("Thursday")),
                DataCell(Text("Subject 1")),
                DataCell(Text("Subject 2")),
                DataCell(Text("Subject 3")),
                DataCell(Text("Subject 4")),
                DataCell(Text("Subject 5")),
                DataCell(Text("Subject 6")),
              ]),
            ],
            columns: const [
              DataColumn(label: Text("Day/Time")),
              DataColumn(label: Text("08:00 AM - 09:30 AM")),
              DataColumn(label: Text("09:30 AM - 11:00 AM")),
              DataColumn(label: Text("11:00 AM - 12:30 AM")),
              DataColumn(label: Text("12:30 AM - 02:30 AM")),
              DataColumn(label: Text("02:30 AM - 04:00 AM")),
              DataColumn(label: Text("04:00 AM - 05:30 AM")),
            ],
          )
        ],
      ),
    );
  }
}
