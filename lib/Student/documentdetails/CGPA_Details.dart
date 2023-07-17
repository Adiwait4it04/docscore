import 'package:flutter/material.dart';
import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/widgets/test_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../resources/constants.dart';

class adddocs2 extends StatefulWidget {
  const adddocs2({super.key});

  @override
  State<adddocs2> createState() => _adddocs2State();
}

final TextEditingController _percent_calc = TextEditingController();

List<String> _sections = [
  "AB1",
  "AB2",
  "R1",
  "R2",
];
String boards = "";

class _adddocs2State extends State<adddocs2> {
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
                          "${name[2]}",
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
                        return "Select your section";
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
                      child: Text("Select your Section"),
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
                    hintText: "Enter your CGPA",
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
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
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
                        Student_home_page(),
                      );
                    },
                    child: InkWell(
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
