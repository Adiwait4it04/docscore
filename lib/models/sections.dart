import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore/models/student.dart' as studentModel;

class Section {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getSections() async {
    QuerySnapshot querySnapshot = await _firestore.collection("sections").get();
    List<String> sectionNames = [];
    querySnapshot.docs.forEach((doc) {
      sectionNames.add(doc.id);
    });
    return sectionNames;
  }

  Future<Map<String, String>> getSectionFacultyAdvisors(
      String SectionName) async {
    QuerySnapshot querySnapshot = await _firestore
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

//Final function made
  Future<String> updateStudents(
      String sec, String facultyAdvUid, String regno) async {
    String res = "Error";

    _firestore
        .collection("sections")
        .doc(sec)
        .collection("Faculty advisors")
        .doc(facultyAdvUid)
        .update({
      "Students": FieldValue.arrayUnion([regno])
    });

    return res;
  }
}
