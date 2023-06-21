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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1F2C45),
                  Color(0xFF274B93),
                  Color(0XFF2A519D),
                ],
              ),
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
                        icon: const Icon(Icons.menu),
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
      ),
    );
  }
}
