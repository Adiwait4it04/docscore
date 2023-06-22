import 'package:docscore/resources/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:docscore/widgets/text_input.dart';

class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({super.key});

  @override
  State<FacultyLoginScreen> createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _loginFaculty() async {
    setState(() {
      _isLoading = true;
    });
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 1),
                  // SVG image

                  SvgPicture.asset(
                    'assets/srm-logo.svg',
                    height: 70,
                  ),

                  const SizedBox(
                    height: 64,
                  ),

                  // Email input
                  TextInput(
                    textEditingController: _emailController,
                    hintText: 'SRM Email',
                    textInputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  //Password input
                  TextInput(
                    textEditingController: _passwordController,
                    hintText: 'Password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // Login button
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text('Login'),
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Flexible(child: Container(), flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
