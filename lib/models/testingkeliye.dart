import 'package:docscore/models/sections.dart';
import 'package:flutter/material.dart';
import 'package:docscore/models/users.dart' as user_model;
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
          var some = await user_model.User()
              .getStudentFromUid("n84jT5BWVAgSbS1TYrQ2Ak9Kupg1");
          print(some);
        },
        child: Text("DABAO"),
      ),
    );
  }
}
