// ignore_for_file: camel_case_types

import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/sidebar_menu.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/resources/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore/models/users.dart' as user_model;
import 'package:docscore/Student/student_home.dart';

class Student_home_page extends StatefulWidget {
  Student_home_page({
    super.key,
  });

  @override
  State<Student_home_page> createState() => _Student_home_pageState();
}

class _Student_home_pageState extends State<Student_home_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? regno;
  String? name;

  void getStudent() async {
    String num =
        await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);

    String StName = await user_model.User().getStudentNameFromRegNo(num);

    setState(() {
      regno = num;
      name = StName;
    });
  }

  getregno() async {
    String num =
        await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);

    return num.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    getregno();
    getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: backgroundGradient(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 12,
                right: 12,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: ButtonColor(),
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Image.asset(
                          'assets/SRM_1.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 15),
                    child: FittedBox(
                      child: Text(
                        "Hi,${name}!",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 30 * MediaQuery.of(context).textScaleFactor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lengthofitems(),
                      itemBuilder: (context, int index) {
                        return SingleChildScrollView(
                          child: StudentHomeWidget(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            backgroundColor: ButtonColor(),
            onPressed: () {
              nextScreen(
                context,
                const adddocs(),
              );
            },
            tooltip: 'Add Item',
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
