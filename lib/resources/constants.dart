// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore/models/users.dart' as user_model;
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
List<String> items = [];
List<String> item_link = [];
List<int> item_verified = [];
int i = 0;
int j = i++;
final regno = user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);

nextScreen(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

replaceScreen(BuildContext context, Widget screen) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

goBack(BuildContext context) {
  return Navigator.pop(context);
}

StudentHomeWidget(index) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 30.0, left: 110, right: 110, bottom: 30),
    child: InkWell(
      onTap: () {
        String link = item_link[index];
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFE9EFFF),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.document_scanner,
                color: Color(0xFF2A519D),
              ),
              FittedBox(
                child: Text(
                  items[index],
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF2A519D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

additems(String item) async {
  Map? docs = await user_model.User().getStudentDocumentList(await regno);
  items.add(item);
  item_link.add(docs![item][1]);
  item_verified.add(docs[item][0]);
}

lengthofitems() {
  return items.length;
}

icrement() {
  i++;
}
