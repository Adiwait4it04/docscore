import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as student_model;
import 'package:docscore/models/faculty.dart' as faculty_model;

class User {
  // FUNCTION TO UPDATE OR ADD INTO DATABASE

  // add student in user collection with nill documents uploaded
  static Future addNewStudent(String regno, String studentName) async {
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

  // Update document url in student user

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

  // update faculty students

  // FUNCTIONS TO GET FROM DATABASE
  static Future<bool> alreadyExists(String id) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(id).get();
    return documentSnapshot.exists;
  }

  static Future getFacultyfromUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "faculty")
        .get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }

  static Future getStudentDocumentList(String regNo) async {
    DocumentSnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("users").doc(regNo).get();
    if (querySnapshot.exists) {
      return querySnapshot["Documents"];
    } else {
      return null;
    }
  }

  static Future getStudentsfromUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "student")
        .get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }
}
