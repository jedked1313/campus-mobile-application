import 'package:flutter/material.dart';
import 'package:campus_mobile_application/standerds/standerds.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../../state management/my_provider.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send Message")),
      body: ListView(
        children: [
          Image.asset(
            "assets/image/sendmessage.jpg",
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonHideUnderline(
                    child: GFDropdown(
                      hint: const Text("Major"),
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
                      items: specialization.keys
                          .map((data) => DropdownMenuItem(
                                value: data,
                                child: Text(
                                  data,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height >
                                                  740
                                              ? 12
                                              : 8),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: GFDropdown(
                      hint: const Text("Year"),
                      icon: const Icon(Icons.expand_circle_down_outlined),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      borderRadius: BorderRadius.circular(10),
                      isDense: false,
                      border: const BorderSide(color: Colors.black12, width: 1),
                      dropdownButtonColor: Colors.grey[300],
                      value: Provider.of<MyProvider>(context).dropdownValue2,
                      onChanged: (newValue) {
                        Provider.of<MyProvider>(context, listen: false)
                            .dropdownValueSet2(newValue);
                      },
                      items: specialization[
                              Provider.of<MyProvider>(context).dropdownValue]
                          ?.map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height >
                                                  740
                                              ? 12
                                              : 8),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent)),
                  hintText: "Write The Message Here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: color1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1.5, color: color1))),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GFButton(
                    color: color1,
                    type: GFButtonType.outline,
                    text: "Cancel",
                    textStyle: TextStyle(
                        color: color1,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: GFButton(
                    text: "Post",
                    color: color1,
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    onPressed: () {
                      Provider.of<MyProvider>(context, listen: false)
                                      .dropdownValue ==
                                  null ||
                              Provider.of<MyProvider>(context, listen: false)
                                      .dropdownValue2 ==
                                  null
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(showToast("Major and the year"))
                          : null; // do somthing
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Map<String, List<String>> specialization = {
  'Information Technology': [
    'First',
    'Second',
    'Third',
    'forth',
  ],
  'Software Engineering': [
    'First',
    'Second',
    'Third',
    'forth',
  ],
  'Business Administration': [
    'First',
    'Second',
    'Third',
    'forth',
  ],
  'Electronics Engineering': [
    'First',
    'Second',
    'Third',
    'forth',
    'fifth',
  ],
  'Artificial Intelligence': [
    'First',
    'Second',
    'Third',
    'forth',
  ],
};
