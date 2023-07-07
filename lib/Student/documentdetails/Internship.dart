import 'package:flutter/material.dart';
import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/widgets/test_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../resources/constants.dart';

class adddocs5 extends StatefulWidget {
  const adddocs5({super.key});

  @override
  State<adddocs5> createState() => _adddocs5State();
}

TextEditingController _internship = TextEditingController();

class _adddocs5State extends State<adddocs5> {
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
                          "${name[5]}",
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: TextForm(
                    textEditingController: _internship,
                    hintText: 'No. of Internships',
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a no. of internships";
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
                      child: const Center(
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.folder_shared,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
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
                        const Student_home_page(regno: "RA2111051010009"),
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
