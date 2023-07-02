class Faculty {
  final String name;
  final String role;
  final List<String> sections;

  const Faculty({
    required this.name,
    this.role = "faculty",
    required this.sections,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "sections": sections,
      };
}
