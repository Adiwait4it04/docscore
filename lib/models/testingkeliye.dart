import 'package:docscore/models/sections.dart';
import 'package:flutter/material.dart';

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
          var some = await Section.addFacultyList("001","Chinnasamy",["AB2","AB1"]);
          print(some);
        },
        child: Text("DABAO"),
      ),
    );
  }
}
