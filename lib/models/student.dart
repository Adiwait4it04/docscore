class Student {
  final String name;
  final String role;
  final Map<String, dynamic> documents;
  final String uid;

  Student({
    required this.uid,
    required this.name,
    this.role = "student",
    required this.documents,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "role": role,
        "documents": documents,
      };
}
