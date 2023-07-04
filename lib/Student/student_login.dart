// ignore_for_file: use_build_context_synchronously

import 'package:docscore/Student/student_signup.dart';
import 'package:docscore/resources/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore/resources/auth/auth_method.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/models/users.dart' as user_model;

class StudentLoginPage extends StatefulWidget {
  StudentLoginPage({super.key});

  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    List<String?> res = await AuthMethods().loginStudent(
        email: emailController.text, password: passwordController.text);
    if (res[0] == "Success") {
      String regno = await user_model.User().getStudentFromUid(res[1]!);
      replaceScreen(
          context,
          Student_home_page(
            regno: regno,
          ));
    }
  }

  @override
  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StudentSignup(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  Image.asset(
                    'assets/SRM_1.jpg',
                    height: 150,
                    width: 150,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //welcome back text field
                  Text(
                    "Welcome Back to the Student's Portal",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Color(0xFFEEEEEE),
                          filled: true,
                          hintText: 'SRM Email ID',
                          hintStyle: TextStyle(color: Colors.grey)),
                      obscureText: false,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Color(0xFFEEEEEE),
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey)),
                      obscureText: true,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //forgot password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFFE0E0E0)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  //log in button
                  GestureDetector(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all the fields"),
                          ),
                        );
                      } else {
                        signUserIn();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25.0),
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //not a member?Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: navigateToSignup,
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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
