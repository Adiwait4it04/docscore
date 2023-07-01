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

  static Future getSectionFacultyAdvisors(String SectionName) async {
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

  static Future getStudentDocumentList(String regno) async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc("RA2111051010027")
        .get();
    if (querySnapshot.exists) {
      return querySnapshot["Documents"];
    } else {
      return null;
    }
  }

  static Future addStudentList(String regno, String studentName) async {
    await FirebaseFirestore.instance.collection("users").doc(regno).set(
      {
        "role": "student",
        "Name": studentName,
        "Documents": {
          "10th_Marksheet": "10th Marksheet.pdf",
          "12th_Marksheet": "12th Marksheet.pdf",
          "JEE_Admit_Card": "JEE Admit Card.pdf",
          "JEE_Rank_Card": "JEE Rank Card.pdf",
        }
      },
    );
  }
}
