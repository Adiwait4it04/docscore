// ignore_for_file: use_build_context_synchronously

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

class adddocs0 extends StatefulWidget {
  const adddocs0({super.key});

  @override
  State<adddocs0> createState() => _adddocs0State();
}

class _adddocs0State extends State<adddocs0> {
  final TextEditingController _percent_calc = TextEditingController();

  List<String> _sections = [
    "CBSE",
    "ICSE",
    "State Board",
    "Other",
  ];
  String boards = "";
  bool isButtonActive = true;
  File? file = null;
  PlatformFile? pickedFile;

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void upload_doc() async {
    setState(() {
      isButtonActive = false;
    });
    if (file == null) return;
    String url = await StorageMethods().uploadDocument("${name[0]}", file!);
    user_model.User user = user_model.User();
    String res = await user_model.User().updateStudentDocUrl(
        await user.getStudentRegNoFromUid(_auth.currentUser!.uid),
        "${name[0]}",
        url);
    if (res == "Success") {
      if (items.contains(name[0]))
        replaceScreen(
          context,
          Student_home_page(),
        );
      else {
        additems(
          name[0],
        );
        buttonStates[0] = false;
        replaceScreen(
          context,
          Student_home_page(),
        );
      }
    }
  }

  Widget getFileSelectWidget() {
    if (file == null) {
      return IconButton(
        onPressed: select_doc,
        icon: const Icon(
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
                              const adddocs(),
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
                          "${name[0]}",
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
                      child: Center(
                        child: getFileSelectWidget(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: InkWell(
                    onTap: isButtonActive ? upload_doc : () {},
                    child: isButtonActive
                        ? Container(
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
                          )
                        : const CircularProgressIndicator(),
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
