// ignore_for_file: unused_import, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Signup Faculty not completed do not use
  Future<String> signupFaculty({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        res = "Success";
      }
    } on FirebaseAuthException catch (e) {
      res = e.code.toString();
    }

    return res;
  }

  //login for faculty

  Future<String> loginFaculty({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      } else {
        res = "empty-fields";
      }
    } on FirebaseAuthException catch (e) {
      res = e.code.toString();
    }
    return res;
  }

  // login for student
  Future<List<String?>> loginStudent(
      {required email, required password}) async {
    List<String?> res = ["Some error occured", null];
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = ["Success", user.user!.uid];
      } else {
        res = ["empty-fields", null];
      }
    } on FirebaseAuthException catch (e) {
      res = [e.code.toString(), null];
    }
    return res;
  }

  // signup for student
  Future<List<String?>> signupStudent(
      {required email, required password}) async {
    List<String?> res = ["Some error occured", null];
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        res = ["Success", userCredential.user!.uid];
      }
    } on FirebaseAuthException catch (e) {
      res = [e.code.toString(), null];
    }
    return res;
  }
}
