import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as student_model;
import 'package:docscore/models/faculty.dart' as faculty_model;

class User {
  // FUNCTIONS TO UPDATE OR ADD INTO DATABASE

  // add student in user collection with nill documents uploaded
  static Future addStudent(String regno, String studentName) async {
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
}
