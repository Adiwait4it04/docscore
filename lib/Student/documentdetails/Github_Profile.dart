// ignore_for_file: unused_import, use_build_context_synchronously

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

class adddocs3 extends StatefulWidget {
  const adddocs3({super.key});

  @override
  State<adddocs3> createState() => _adddocs3State();
}

class _adddocs3State extends State<adddocs3> {
  TextEditingController _linkcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void update_url() async {
    String link = _linkcontroller.text;
    String res = await user_model.User().updateStudentDocUrl(
      await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid),
      "${name[3]}",
      link,
    );
    if (res == "Success") {
      additems(
        name[3],
      );
      buttonStates[3] = false;
      replaceScreen(
        context,
        Student_home_page(),
      );
    }
  }
  // void upload_url() async {
  //   String link = _linkcontroller.text;
  //   String res = await user_model.User().updateStudentDocUrl(
  //     await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid),
  //     "${name[3]}",
  //     link,
  //   );
  //   if (res == "Success") {
  //     additems(
  //       name[0],
  //     );
  //     buttonStates[0] = false;
  //     replaceScreen(
  //       context,
  //       Student_home_page(),
  //     );
  //   }
  // }

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
                          "${name[3]}",
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 100, bottom: 220),
                  child: TextForm(
                    textEditingController: _linkcontroller,
                    hintText: "Enter Github Profile Link",
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a percentage";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: InkWell(
                    onTap: update_url,
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
                        "Upload Link",
                        style: TextStyle(
                          color: Colors.white,
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
