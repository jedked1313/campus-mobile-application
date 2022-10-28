import 'package:flutter/material.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DataTable(
            rows: const [
              DataRow(cells: [
                DataCell(Text("السبت")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("الأحد")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("الاثنين")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("الثلاثاء")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("الأربعاء")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
              ]),
              DataRow(cells: [
                DataCell(Text("الخميس")),
                DataCell(Text("مادة 1")),
                DataCell(Text("مادة 2")),
                DataCell(Text("مادة 3")),
                DataCell(Text("مادة 4")),
                DataCell(Text("مادة 5")),
                DataCell(Text("مادة 6")),
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
