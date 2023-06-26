// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List buttonStates = [true, true, true];

class adddocs extends StatefulWidget {
  const adddocs({super.key});

  @override
  State<adddocs> createState() => _adddocsState();
}

class _adddocsState extends State<adddocs> {
  List<String> name = [
    "10th Marksheet",
    "12th Marksheet",
    "CGPA Details",
  ];
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
                      buttonStates[2] == false)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 15),
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
                                        setState(
                                          () {
                                            additems(
                                              name[0],
                                            );
                                            buttonStates[0] = false;
                                          },
                                        );
                                        replaceScreen(
                                          context,
                                          const Student_home_page(),
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
                                          fontSize: 25,
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
                                        const Student_home_page(),
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
                                      "12th Marksheet",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 25,
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
                                      setState(
                                        () {
                                          additems(
                                            name[2],
                                          );
                                          buttonStates[2] = false;
                                        },
                                      );
                                      replaceScreen(
                                        context,
                                        const Student_home_page(),
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
                                        fontSize: 25,
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
