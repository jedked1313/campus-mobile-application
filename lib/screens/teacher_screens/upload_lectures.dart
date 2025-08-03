import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:campus_mobile_application/standerds/standerds.dart';
import 'package:campus_mobile_application/state%20management/my_provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class UploadLectures extends StatefulWidget {
  const UploadLectures({super.key});

  @override
  State<UploadLectures> createState() => _UploadLecturesState();
}

class _UploadLecturesState extends State<UploadLectures> {
  String? _fileText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Upload Lecture")),
        // body: const PDF(swipeHorizontal: true)
        //     .cachedFromUrl('http://172.20.10.8/Data_mining_assignment.pdf'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/upload_lecture.jpg",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              DropdownButtonHideUnderline(
                child: GFDropdown(
                  hint: const Text("Subject"),
                  isExpanded: true,
                  icon: const Icon(Icons.expand_circle_down_outlined),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  borderRadius: BorderRadius.circular(10),
                  isDense: false,
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Colors.grey[300],
                  value: Provider.of<MyProvider>(context).dropdownValue3,
                  onChanged: (newValue) {
                    Provider.of<MyProvider>(context, listen: false)
                        .dropdownValueSet3(newValue);
                  },
                  items: subjects
                      .map((data) => DropdownMenuItem(
                            value: data,
                            child: Text(
                              data,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height > 740
                                          ? 12
                                          : 8),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: _uploadFile,
                child: GFBorder(
                  radius: const Radius.circular(10),
                  color: color1,
                  dashedLine: const [10, 6],
                  type: GFBorderType.rRect,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_rounded,
                          size: MediaQuery.of(context).size.height * 0.1,
                          color: color1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_fileText != null)
                              Icon(
                                CupertinoIcons.doc,
                                size: 35,
                                color: color1,
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                _fileText ?? "Choose File",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GFButton(
                color: color1,
                fullWidthButton: true,
                highlightElevation: 2,
                onPressed: () {
                  Provider.of<MyProvider>(context, listen: false)
                              .dropdownValue3 ==
                          null
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(showToast("Subject"))
                      : null; // do somthing
                },
                child: const Text(
                  "Send File",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }

  void _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile file2 = result.files.first;
      setState(() {
        _fileText = file2.name;
      });
    } else {
      // else
    }
  }
}

var subjects = [
  'OOP',
  'Artificial Intelligence',
  'Internet of Things',
  'Programming Basics',
  'Data Structures'
];
