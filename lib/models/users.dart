import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as student_model;
import 'package:docscore/models/faculty.dart' as faculty_model;

class User {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FUNCTION TO UPDATE OR ADD INTO DATABASE

  // add student in user collection with nill documents uploaded
  Future addNewStudent(String uid, String regno, String studentName) async {
    String res = "Error";
    try {
      student_model.Student student =
          student_model.Student(uid: uid, name: studentName, documents: {
        "10th_Marksheet": "",
        "12th_Marksheet": "",
        "JEE_Admit_Card": "",
        "JEE_Rank_Card": "",
      });

      await _firestore.collection("users").doc(regno).set(
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
  Future addFaculty(
      String uid, String facultyName, List<String> sections) async {
    faculty_model.Faculty faculty = faculty_model.Faculty(
      name: facultyName,
      sections: sections,
    );

    await _firestore.collection("users").doc(uid).set(
          faculty.toJson(),
        );
  }

  // update faculty students

  // FUNCTIONS TO GET FROM DATABASE
  Future<bool> alreadyExists(String id) async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection("users").doc(id).get();
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

  Future getStudentDocumentList(String regNo) async {
    DocumentSnapshot querySnapshot =
        await _firestore.collection("users").doc(regNo).get();
    if (querySnapshot.exists) {
      return querySnapshot["Documents"];
    } else {
      return null;
    }
  }

  Future getStudentsfromUsers() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .where("role", isEqualTo: "student")
        .get();
    List<String> Regno = [];
    querySnapshot.docs.forEach((doc) {
      Regno.add(doc.id);
    });
    return Regno;
  }

  Future getStudentFromUid(String uid) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").where("uid", isEqualTo: uid).get();
    String regno = "";
    querySnapshot.docs.forEach((element) {
      regno = element.id;
    });
    print(regno);
    return regno;
  }
}
