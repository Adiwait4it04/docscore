import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as studentModel;

class Section {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<String>> getSections() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("sections").get();
    List<String> sectionNames = [];
    querySnapshot.docs.forEach((doc) {
      sectionNames.add(doc.id);
    });
    return sectionNames;
  }

  static Future<Map<String, String>> getSectionFacultyAdvisors(
      String SectionName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("sections")
        .doc(SectionName)
        .collection("Faculty advisors")
        .get();
    Map<String, String> facultyAdvisors = {};
    querySnapshot.docs.forEach((doc) {
      facultyAdvisors[doc.get("name")] = doc.id;
    });
    return facultyAdvisors;
  }

  static Future<String> updateStudents(
      String sec, String facultyAdvUid, String regno) async {
    String res = "Error";

    // QuerySnapshot

    return res;
  }
}
