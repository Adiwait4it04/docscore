// ignore_for_file: unused_import

import 'package:docscore/Student/documentdetails/10th_Marksheet.dart';
import 'package:docscore/Student/documentdetails/12th_Marksheet.dart';
import 'package:docscore/Student/documentdetails/Internship.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/Student/student_login.dart';
import 'package:docscore/Student/student_profile.dart';
import 'package:docscore/models/testingkeliye.dart';
import 'package:docscore/resources/auth/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/resources/constants.dart';
import 'package:docscore/Student/student_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Docscore',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: StudentProfile(),
      home: const adddocs5(),
      // home: Student_home_page(
      //   regno: "RA2111051010009",
      // ),
      // home: StreamBuilder(
      //   stream: AuthMethods().auth.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const Student_home_page();
      //     }
      //     return StudentSignup();
      //   },
      // ),
    );
  }
}
