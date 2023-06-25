// ignore_for_file: unused_import

import 'dart:ui';

import 'package:docscore/Student/student_home.dart';
import 'package:docscore/Student/student_login.dart';
import 'package:docscore/resources/auth/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:docscore/Faculty/faculty_login.dart';
import 'package:docscore/Faculty/faculty_signup.dart';

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
      home: StreamBuilder(
        stream: AuthMethods().auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Student_home_page();
          }
          return StudentLoginPage();
        },
      ),
    );
  }
}
