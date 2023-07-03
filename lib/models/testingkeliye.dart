import 'package:docscore/models/sections.dart';
import 'package:flutter/material.dart';
import 'package:docscore/models/users.dart';
import 'package:docscore/models/sections.dart' as section_model;

class TestingKeLiye extends StatelessWidget {
  const TestingKeLiye({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LMAO NOOB HO KYA"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          var some =
              await section_model.Section().getSectionFacultyAdvisors("AB2");
          print(some);
        },
        child: Text("DABAO"),
      ),
    );
  }
}
