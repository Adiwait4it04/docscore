// ignore_for_file: camel_case_types

import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/resources/colors.dart';
import 'package:docscore/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Student_home_page extends StatefulWidget {
  const Student_home_page({super.key});

  @override
  State<Student_home_page> createState() => _Student_home_pageState();
}

class _Student_home_pageState extends State<Student_home_page> {
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
                      Image.asset('assets/SRM.jpeg'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 15),
                    child: Text(
                      "Hi,Krish!",
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
