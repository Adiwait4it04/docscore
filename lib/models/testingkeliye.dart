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
          final result = await FilePicker.platform.pickFiles();
          if (result == null) return;
          final PlatformFile? file = result.files.first;
          String url =
              await StorageMethods().uploadDocument("test", File(file!.path!));
          print(url);
        },
        child: Text("DABAO"),
      ),
    );
  }
}
