import 'package:docscore/resources/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore/resources/auth/auth_method.dart';

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
    String res = await AuthMethods().loginStudent(
        email: emailController.text, password: passwordController.text);
    if (res == "Success") print("Done");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: backgroundGradient(),
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
                      onTap: signUserIn,
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

                    const SizedBox(height: 50),
                    //or continue with
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 0.5, color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(thickness: 0.5, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    //gmail+google sign in button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //gmail button
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFEEEEEE),
                          ),
                          child: Image.asset(
                            'assets/gmail.png',
                            height: 40,
                          ),
                        ),

                        const SizedBox(
                          width: 25,
                        ),

                        //google button
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Image.asset(
                            'assets/google.png',
                            height: 40,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 50,
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
                        const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
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
