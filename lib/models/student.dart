class Student {
  final String name;
  final String role;
  final Map<String, dynamic> documents;

  Student({
    required this.name,
    this.role = "student",
    required this.documents,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "documents": documents,
      };
}
