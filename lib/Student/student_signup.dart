// ignore_for_file: sort_child_properties_last, unused_import, unused_field

import 'package:docscore/Faculty/utils/utils.dart';
import 'package:docscore/Student/student_login.dart';
import 'package:docscore/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/constants/colors.dart';
import 'package:docscore/widgets/text_input.dart';
import 'package:docscore/widgets/test_form_field.dart';
import 'package:docscore/models/users.dart' as users_model;

class StudentSignup extends StatefulWidget {
  const StudentSignup({super.key});

  @override
  State<StudentSignup> createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _section = "";
  String _faculty = "";
  bool _isLoading = false;

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
  void dispose() {
    _nameController.dispose();
    _regnoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signupStudent() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      // Add validation that the student already does not exist in database
      if (await users_model.User.alreadyExists(_regnoController.text)) {
        showSnackBar("Student already exists", context);

        setState(() {
          _isLoading = false;
        });
        return;
      } else {
        // add student data to firebase
        users_model.User.addStudent(
          _regnoController.text,
          _nameController.text,
        );
        showSnackBar("Signup completed", context);
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      print("Did not validate");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _sections.

    final dropDownBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                      child: TextForm(
                        textEditingController: _nameController,
                        hintText: 'Name',
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your name";
                          }
                          return null;
                        },
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
                      child: TextForm(
                        textEditingController: _regnoController,
                        hintText: 'Registration Number',
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your registration number";
                          }
                          return null;
                        },
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
                      child: TextForm(
                        textEditingController: _emailController,
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter an email";
                          }
                          // if (!value.toLowerCase().endsWith("@srmist.edu.in")) {
                          //   return "Enter a valid SRM email";
                          // }

                          return null;
                        },
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
                      child: TextForm(
                        textEditingController: _passwordController,
                        hintText: 'Password',
                        textInputType: TextInputType.text,
                        isPass: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        },
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
                      child: TextForm(
                        textEditingController: _confirmPasswordController,
                        hintText: 'Confirm password',
                        textInputType: TextInputType.text,
                        isPass: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm your password";
                          }
                          if (value != _passwordController.text) {
                            return "Passwords don't match";
                          }

                          return null;
                        },
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
                        validator: (value) {
                          if (value == null) {
                            return "Select your section";
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null) {
                            return "Select your faculty advisor";
                          }
                          return null;
                        },
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
                      onTap: _signupStudent,
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
      ),
    );
  }
}
