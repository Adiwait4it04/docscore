// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/Student/documentdetails/10th_Marksheet.dart';
import 'package:docscore/Student/documentdetails/12th_Marksheet.dart';
import 'package:docscore/Student/documentdetails/CGPA_Details.dart';
import 'package:docscore/Student/documentdetails/CodingCompetions.dart';
import 'package:docscore/Student/documentdetails/Coding_Practice_Platform_Profile.dart';
import 'package:docscore/Student/documentdetails/FullStackDeveloper_Experience.dart';
import 'package:docscore/Student/documentdetails/Github_Profile.dart';
import 'package:docscore/Student/documentdetails/Inhouse.dart';
import 'package:docscore/Student/documentdetails/Internship.dart';
import 'package:docscore/Student/documentdetails/Membersofproffessionalbodies.dart';
import 'package:docscore/Student/documentdetails/Skillset&Standard_Certifications_Completed.dart';
import 'package:docscore/Student/documentdetails/projets_done.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore/models/users.dart' as user_model;

List buttonStates = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
];
List name = [
  "10th Marksheet",
  "12th Marksheet",
  "CGPA Details",
  "Github Profile",
  "Coding Practice Platform Profile",
  "Internship Experience",
  "Skillset & Standard Certifications Completed",
  "Projects Done",
  "Full Stack Developer Experience",
  "Coding Competitions & Hackathon Experience",
  "Inhouse Projects Done",
  "Membership of Professional Bodies",
];

class adddocs extends StatefulWidget {
  const adddocs({super.key});

  @override
  State<adddocs> createState() => _adddocsState();
}

class _adddocsState extends State<adddocs> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void initState() {
    super.initState();
    syncFromDatabase();
  }

  void syncFromDatabase() async {
    setState(() {
      _isLoading = true;
    });

    Map? docs = await user_model.User().getStudentDocumentList(
        await user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid));
    if (docs == null)
      return;
    else {
      for (int i = 0; i < docs.length; i++) {
        if (docs[name[i]] != null) {
          buttonStates[i] = false;
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          replaceScreen(context, Student_home_page());
                        },
                        icon: Icon(
                          Icons.arrow_back,
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
                    child: Text(
                      "Add Your Documents",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (buttonStates[0] == false &&
                      buttonStates[1] == false &&
                      buttonStates[2] == false &&
                      buttonStates[3] == false &&
                      buttonStates[4] == false &&
                      buttonStates[5] == false &&
                      buttonStates[6] == false &&
                      buttonStates[7] == false &&
                      buttonStates[8] == false &&
                      buttonStates[9] == false &&
                      buttonStates[10] == false &&
                      buttonStates[11] == false &&
                      buttonStates[12] == false)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100, left: 15),
                        child: Text(
                          "All Documents Added",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  else
                    buttonStates[0]
                        ? Padding(
                            padding: const EdgeInsets.only(top: 40.0, left: 25),
                            child: Container(
                              height: 60,
                              width: 320,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                onTap: buttonStates[0]
                                    ? () {
                                        nextScreen(
                                          context,
                                          const adddocs0(),
                                        );
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "10th Marksheet",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.document_scanner_sharp,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                  buttonStates[1]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[1]
                                  ? () {
                                      nextScreen(context, const adddocs1());
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "12th Marksheet",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[2]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[2]
                                  ? () {
                                      nextScreen(
                                        context,
                                        const adddocs2(),
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "CGPA details",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[3]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[3]
                                  ? () {
                                      nextScreen(
                                        context,
                                        const adddocs3(),
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[3],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[4]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[4]
                                  ? () {
                                      replaceScreen(
                                        context,
                                        const adddocs4(),
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[4],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[5]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[5]
                                  ? () {
                                      replaceScreen(
                                        context,
                                        const adddocs5(),
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[5],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[6]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[6]
                                  ? () {
                                      replaceScreen(
                                        context,
                                        const adddocs6(),
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          name[6],
                                          overflow: TextOverflow.clip,
                                          softWrap: false,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.document_scanner_sharp,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[7]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[7]
                                  ? () {
                                      replaceScreen(context, const adddocs7());
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[7],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[8]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[8]
                                  ? () {
                                      setState(
                                        () {
                                          replaceScreen(
                                            context,
                                            const adddocs8(),
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[8],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[9]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[9]
                                  ? () {
                                      setState(
                                        () {
                                          replaceScreen(
                                            context,
                                            const adddocs9(),
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          name[9],
                                          overflow: TextOverflow.clip,
                                          softWrap: false,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.document_scanner_sharp,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[10]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[10]
                                  ? () {
                                      setState(
                                        () {
                                          replaceScreen(
                                            context,
                                            const adddocs10(),
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[10],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  buttonStates[11]
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: buttonStates[11]
                                  ? () {
                                      setState(
                                        () {
                                          replaceScreen(
                                            context,
                                            const adddocs11(),
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      name[11],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.document_scanner_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
