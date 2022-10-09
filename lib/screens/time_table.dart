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
              ]),
              DataRow(cells: [
                DataCell(Text("الأحد")),
                DataCell(Text("مادة 2")),
              ]),
            ],
            columns: const [
              DataColumn(label: Text("Day/Time")),
              DataColumn(label: Text("08:00 AM - 09:30 AM")),
            ],
          )
        ],
      ),
    );
  }
}
