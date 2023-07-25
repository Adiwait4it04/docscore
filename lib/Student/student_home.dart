// ignore_for_file: camel_case_types, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/sidebar_menu.dart';
import 'package:docscore/Student/student_profile.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/resources/constants.dart' as constants;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore/models/users.dart' as user_model;
import 'package:docscore/Student/student_home.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Student_home_page extends StatefulWidget {
  Student_home_page({
    super.key,
  });

  @override
  State<Student_home_page> createState() => _Student_home_pageState();
}

class _Student_home_pageState extends State<Student_home_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? name;
  bool isLoading = false;

  void getStudent() async {
    String num =
        await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);

    String StName = await user_model.User().getStudentNameFromRegNo(num);

    setState(() {
      name = StName;
    });
  }

  void syncFromDatabase_home() async {
    setState(() {
      isLoading = true;
    });
    Map? docs =
        await user_model.User().getStudentDocumentList(await constants.regno);
    List? keys = docs!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (docs[keys[i]] != null) {
        constants.additems(keys[i]);
      }
    }
    // print("ran");
    // print(constants.items);

    setState(() {
      isLoading = false;
    });
  }

  void refresh() {
    constants.items = [];
    constants.item_link = [];
    constants.item_verified = [];
  }

  @override
  void initState() {
    getStudent();

    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    syncFromDatabase_home();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LiquidPullToRefresh(
            color: const Color(0xFF0D47A1),
            backgroundColor: Colors.white,
            springAnimationDurationInMilliseconds: 1000,
            onRefresh: () async {
              // to test out refresh
              refresh();
              syncFromDatabase_home();
            },
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
                        CircleAvatar(
                          backgroundColor: const Color(0xFF0D47A1),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                constants.nextScreen(
                                  context,
                                  const StudentProfile(),
                                );
                              },
                              icon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
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
                            fontSize:
                                30 * MediaQuery.of(context).textScaleFactor,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: constants.lengthofitems(),
                        itemBuilder: (context, int index) {
                          return SingleChildScrollView(
                            child: constants.StudentHomeWidget(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
              constants.nextScreen(
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
