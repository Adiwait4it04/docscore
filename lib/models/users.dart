import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as student_model;
import 'package:docscore/models/faculty.dart' as faculty_model;

class User {
  // FUNCTIONS TO UPDATE OR ADD INTO DATABASE

  // add student in user collection with nill documents uploaded
  static Future addStudent(String regno, String studentName) async {
    String res = "Error";
    try {
      student_model.Student student =
          student_model.Student(name: studentName, documents: {
        "10th_Marksheet": "",
        "12th_Marksheet": "",
        "JEE_Admit_Card": "",
        "JEE_Rank_Card": "",
      });

      await FirebaseFirestore.instance.collection("users").doc(regno).set(
            student.toJson(),
          );

      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // add Faculty in user collection
  static Future addFaculty(
      String uid, String facultyName, List<String> sections) async {
    faculty_model.Faculty faculty = faculty_model.Faculty(
      name: facultyName,
      sections: sections,
    );

    await FirebaseFirestore.instance.collection("users").doc(uid).set(
          faculty.toJson(),
        );
  }

  // FUNCTIONS TO GET FROM DATABASE
  static Future<bool> alreadyExists(String id) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(id).get();
    return documentSnapshot.exists;
  }
}
