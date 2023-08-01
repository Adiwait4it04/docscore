// ignore_for_file: camel_case_types, unused_import, use_build_context_synchronously, non_constant_identifier_names, unnecessary_import

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
  const Student_home_page({
    super.key,
  });

  @override
  State<Student_home_page> createState() => _Student_home_pageState();
}

class _Student_home_pageState extends State<Student_home_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? name;
  late Future<Map<String, dynamic>> _studentHomePageData;

  // Future<Map?> getStudentData() async {
  //   String num =
  //       await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);

  //   // List<String> docNames = []
  //   var data = await user_model.User().getStudentDocumentList(num);

  //   return data;
  // }

  @override
  void initState() {
    _studentHomePageData = user_model.User().getStudentHomePageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: _studentHomePageData,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while data is being fetched
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: backgroundGradient(),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE9EFFF),
                  ),
                ),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                Map<String, dynamic> data = snapshot.data!;
                name = data["name"];

                return SingleChildScrollView(
                  child: LiquidPullToRefresh(
                    color: const Color(0xFF0D47A1),
                    backgroundColor: Colors.white,
                    showChildOpacityTransition: false,
                    onRefresh: () async {
                      // to test out refresh
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Student_home_page(),
                        ),
                        (Route<dynamic> route) => false,
                      );
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
                                          StudentProfile(),
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
                              padding:
                                  const EdgeInsets.only(top: 40.0, left: 15),
                              child: FittedBox(
                                child: Text(
                                  "Hi, ${name}!",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: data["count"],
                                itemBuilder: (context, int index) {
                                  return SingleChildScrollView(
                                    child: StudentHomeWidget(
                                      context,
                                      index,
                                      data["docName"][index],
                                      data["verification"][index],
                                      data["link"][index],
                                    ),
                                  );
                                },
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
          },
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

  StudentHomeWidget(BuildContext context, index, String docName,
      int verification, String link) {
    if (verification == 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE9EFFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF7B1FA2),
              width: 2,
            ),
          ),
          child: ListTile(
            onTap: () {
              constants.launchInBrowser(
                Uri.parse(link),
              );
            },
            leading: const Icon(
              Icons.document_scanner,
              color: Color(0xFF0D47A1),
            ),
            title: Text(
              docName,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                color: const Color(0xFF0D47A1),
              ),
            ),
            subtitle: Text(
              "Not Verified",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                color: const Color(0xFF0D47A1),
              ),
            ),
            trailing: GestureDetector(
              onTap: () async {
                await user_model.User().deleteDoc(
                    await user_model.User()
                        .getStudentRegNoFromUid(_auth.currentUser!.uid),
                    docName);
                _studentHomePageData =
                    user_model.User().getStudentHomePageData();

                constants.refresh(
                  context,
                  const Student_home_page(),
                );
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }

    if (verification == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE9EFFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF43A047),
              width: 2,
            ),
          ),
          child: ListTile(
            onTap: () {
              constants.launchInBrowser(
                Uri.parse(link),
              );
            },
            leading: const Icon(
              Icons.document_scanner,
              color: Color(0xFF0D47A1),
            ),
            title: Text(
              docName,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                color: const Color(0xFF0D47A1),
              ),
            ),
            subtitle: Text(
              "Approved",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                color: const Color(0xFF0D47A1),
              ),
            ),
            trailing: GestureDetector(
              onTap: () async {
                await user_model.User().deleteDoc(
                    await user_model.User()
                        .getStudentRegNoFromUid(_auth.currentUser!.uid),
                    docName);
                _studentHomePageData =
                    user_model.User().getStudentHomePageData();

                constants.refresh(
                  context,
                  const Student_home_page(),
                );
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }
    if (verification == -1) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D47A1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
          ),
          child: ListTile(
            onTap: () {
              constants.launchInBrowser(
                Uri.parse(link),
              );
            },
            leading: const Icon(
              Icons.document_scanner,
              color: Color(0xFF0D47A1),
            ),
            title: Text(
              docName,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Rejected",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                color: Colors.white,
              ),
            ),
            trailing: GestureDetector(
              onTap: () async {
                await user_model.User().deleteDoc(
                    await user_model.User()
                        .getStudentRegNoFromUid(_auth.currentUser!.uid),
                    docName);
                _studentHomePageData =
                    user_model.User().getStudentHomePageData();

                constants.refresh(context, const Student_home_page());
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }
  }
}
