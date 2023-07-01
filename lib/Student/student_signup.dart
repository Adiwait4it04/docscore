// ignore_for_file: sort_child_properties_last

import 'package:docscore/Student/student_login.dart';
import 'package:docscore/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/constants/colors.dart';
import 'package:docscore/widgets/text_input.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({super.key});

  @override
  State<StudentSignup> createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _section = "";
  String _faculty = "";
  final _isLoading = false;

  // get registered sections
  final List<String> _sections = ["AB2", "AB1", "AC1", "AC2"];

  // get registered faculty advisors
  final List<String> _facultyAdv = ["Chinnasamy", "Sasikumar"];

  @override
  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StudentLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _sections.

    final dropDownBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: backgroundGradient(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                children: [
                  // Logo
                  Image.asset("assets/SRM_1.jpg"),

                  const SizedBox(
                    height: 64,
                  ),

                  // Name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.text,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // reg no
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _regnoController,
                      hintText: 'Registration Number',
                      textInputType: TextInputType.text,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // password

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _emailController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                  ),

                  // confirm password

                  const SizedBox(
                    height: 32,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _emailController,
                      hintText: 'Confirm password',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                  ),

                  // section ka drop down
                  const SizedBox(
                    height: 32,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: dropDownBorder,
                        enabledBorder: dropDownBorder,
                        focusedBorder: dropDownBorder,
                        errorBorder: dropDownBorder,
                        contentPadding: EdgeInsets.all(8.0),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text("Select your section"),
                      ),
                      items: _sections.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _section = value ?? "";
                        });
                      },
                    ),
                  ),

                  // faculty advisor ka drop down
                  const SizedBox(
                    height: 32,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: dropDownBorder,
                        enabledBorder: dropDownBorder,
                        focusedBorder: dropDownBorder,
                        errorBorder: dropDownBorder,
                        contentPadding: EdgeInsets.all(8.0),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text("Select your faculty advisor"),
                      ),
                      items: _facultyAdv.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _faculty = value ?? "";
                        });
                      },
                    ),
                  ),

                  // transition to login

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text("Don't have an account? "),
                      ),
                      GestureDetector(
                        onTap: navigateToLogin,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            " Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Signup button

                  const SizedBox(
                    height: 32,
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF090F30),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
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
