import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as studentModel;

class Section {
  static Future<List<String>> getSections() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("sections").get();
    List<String> sectionNames = [];
    querySnapshot.docs.forEach((doc) {
      sectionNames.add(doc.id);
    });
    return sectionNames;
  }

  static Future getSectionFacultyAdvisors(String SectionName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("sections")
        .doc(SectionName)
        .collection("Faculty advisors")
        .get();
    List<String> facultyAdvisors = [];
    querySnapshot.docs.forEach((doc) {
      facultyAdvisors.add(doc.id);
    });
    return facultyAdvisors;
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
}
