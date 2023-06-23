// ignore_for_file: unused_field, sort_child_properties_last, unused_import

import 'package:docscore/resources/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:docscore/widgets/text_input.dart';
import 'package:docscore/resources/auth/auth_method.dart';
import 'package:docscore/Faculty/utils/utils.dart';

class FacultySignupPage extends StatefulWidget {
  const FacultySignupPage({super.key});

  @override
  State<FacultySignupPage> createState() => _FacultySignupPageState();
}

class _FacultySignupPageState extends State<FacultySignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _signupFaculty() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signupFaculty(
        email: _emailController.text, password: _passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (res == "Success") {
      showSnackBar("Signup Success", context);
    } else {
      showSnackBar("Signup Failed", context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(
                top: 10,
                left: 12,
                right: 12,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SVG image

                  SvgPicture.asset(
                    'assets/srm-logo.svg',
                    height: 70,
                  ),

                  const SizedBox(
                    height: 64,
                  ),

                  // Email input
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _emailController,
                      hintText: 'SRM Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  //Password input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      textEditingController: _passwordController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // Login button
                  InkWell(
                    onTap: _signupFaculty,
                    child: Container(
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const Text("Signup"),
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: primaryColor,
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
