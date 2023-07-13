import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/widgets/test_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../resources/constants.dart';
import 'package:file_picker/file_picker.dart';
import '../../resources/firestore/storage.dart';
import 'package:docscore/models/users.dart' as user_model;

class adddocs1 extends StatefulWidget {
  const adddocs1({super.key});

  @override
  State<adddocs1> createState() => _adddocs1State();
}

final TextEditingController _percent_calc = TextEditingController();

List<String> _sections = [
  "CBSE",
  "ICSE",
  "State Board",
  "Other",
];
String boards = "";

class _adddocs1State extends State<adddocs1> {
  File? file = null;
  PlatformFile? pickedFile;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget getFileSelectWidget() {
    if (file == null) {
      return IconButton(
        onPressed: select_doc,
        icon: Icon(
          Icons.folder_shared,
          size: 50,
        ),
      );
    } else {
      return TextButton(
        onPressed: select_doc,
        child: Text(
          pickedFile!.name,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void select_doc() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return;
    pickedFile = result.files.first;
    setState(() {
      file = File(pickedFile!.path!);
    });
  }

  void upload_doc() async {
    if (file == null) return;
    String url = await StorageMethods().uploadDocument("12th marksheet", file!);
    user_model.User user = user_model.User();
    String res = await user.updateStudentDocUrl(
        await user.getStudentFromUid(_auth.currentUser!.uid),
        "12th_Marksheet",
        url);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: Image.asset(
                      'assets/SRM_1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: IconButton(
                          onPressed: () {
                            replaceScreen(
                              context,
                              adddocs(),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: ButtonColor(),
                            size: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "${name[1]}",
                          style: GoogleFonts.montserrat(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Select your Board";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      ),
                      contentPadding: const EdgeInsets.all(8.0),
                      filled: true,
                    ),
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("Select your Board"),
                    ),
                    items: _sections.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        boards = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextForm(
                    textEditingController: _percent_calc,
                    hintText: '% of English + Maths + Science+2 subjects',
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a percentage";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 4,
                    dashPattern: const [30, 30],
                    child: Container(
                      height: 250,
                      width: 320,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: getFileSelectWidget(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          additems(
                            name[1],
                          );
                          buttonStates[1] = false;
                        },
                      );
                      replaceScreen(
                        context,
                        const Student_home_page(regno: "RA2111051010009"),
                      );
                    },
                    child: InkWell(
                      onTap: upload_doc,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF090F30),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Upload Document",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
