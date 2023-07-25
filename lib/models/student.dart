class Student {
  final String name;
  final String role;
  final Map<String, List<dynamic>> documents;
  final String uid;
  final String section;

  Student({
    required this.uid,
    required this.name,
    this.role = "student",
    required this.documents,
    required this.section,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "role": role,
        "documents": documents,
        "section": section,
      };
}
