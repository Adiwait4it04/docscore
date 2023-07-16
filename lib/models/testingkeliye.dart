import 'package:docscore/models/sections.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:docscore/models/users.dart' as user_model;
import 'package:docscore/models/sections.dart' as section_model;
import 'package:docscore/resources/firestore/storage.dart';
import 'dart:io';

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
          String regno = "RA2111051010029";
          String doc = "10th_Marksheet";
          String? res = await user_model.User().deleteDoc(regno, doc);
          print(res);
        },
        child: Text("DABAO"),
      ),
    );
  }
}
