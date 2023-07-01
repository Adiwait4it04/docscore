import 'package:cloud_firestore/cloud_firestore.dart';

class Section {
  static Future<List<String>> getAllSectionNames() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("sections").get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }

  static Future getAllSectionFacultyAdvisors(String SectionName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("sections")
        .doc(SectionName)
        .collection("Faculty advisors")
        .get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }

  static Future getStudents() async {
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
