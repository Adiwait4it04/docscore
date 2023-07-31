// ignore_for_file: non_constant_identifier_names, unused_element, use_build_context_synchronously, unused_import

import 'package:docscore/Student/student_home.dart';
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
var regno = user_model.User().getStudentRegNoFromUid(_auth.currentUser!.uid);
String regno1 = regno.toString();
Future refresh(BuildContext context, Widget screen) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (Route<dynamic> route) => false,
  );
}

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

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

//pop_menu code
void _showpopupmenu(BuildContext context) async {
  final result = await showMenu(
    context: context,
    position: const RelativeRect.fromLTRB(100, 100, 0, 0),
    items: [
      const PopupMenuItem(
        child: Text("Delete"),
      ),
    ],
    elevation: 8.0,
  );
  if (result == 'delete') {
    // Add your delete document logic here
  }
}

StudentHomeWidget(BuildContext context, index, String docName, int verification,
    String link) {
  if (verification == 0) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 110, right: 110, bottom: 30),
      child: InkWell(
        onTap: () {
          launchInBrowser(
            Uri.parse(link),
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFE9EFFF),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFF7B1FA2),
              width: 2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Icon(
                        Icons.document_scanner,
                        color: Color(0xFF2A519D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: IconButton(
                        onPressed: () async {
                          user_model.User().deleteDoc(
                              await user_model.User().getStudentRegNoFromUid(
                                  _auth.currentUser!.uid),
                              docName);
                          refresh(
                            context,
                            const Student_home_page(),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                FittedBox(
                  child: Text(
                    docName,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF2A519D),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Text(
                  "Not Yet Checked",
                  style: TextStyle(
                    color: Color(0xFF2A519D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  if (verification == 1) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 110, right: 110, bottom: 30),
      child: InkWell(
        onTap: () {
          launchInBrowser(
            Uri.parse(link),
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFE9EFFF),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFF43A047),
              width: 2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Icon(
                        Icons.document_scanner,
                        color: Color(0xFF2A519D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: IconButton(
                        onPressed: () async {
                          user_model.User().deleteDoc(
                              await user_model.User().getStudentRegNoFromUid(
                                  _auth.currentUser!.uid),
                              docName);
                          refresh(
                            context,
                            const Student_home_page(),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                FittedBox(
                  child: Text(
                    docName,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF2A519D),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Text(
                  "Verified",
                  style: TextStyle(
                    color: Color(0xFF2A519D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  if (verification == -1) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 110, right: 110, bottom: 30),
      child: InkWell(
        onTap: () {
          launchInBrowser(Uri.parse(link));
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFE9EFFF),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFFC62828),
              width: 2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Icon(
                        Icons.document_scanner,
                        color: Color(0xFF2A519D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: IconButton(
                        onPressed: () async {
                          user_model.User().deleteDoc(
                              await user_model.User().getStudentRegNoFromUid(
                                  _auth.currentUser!.uid),
                              docName);
                          refresh(
                            context,
                            const Student_home_page(),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                FittedBox(
                  child: Text(
                    docName,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF2A519D),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Text(
                  "Rejected",
                  style: TextStyle(
                    color: Color(0xFF2A519D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

additems(String item) async {
  Map? docs = await user_model.User().getStudentDocumentList(await regno);
  if (!items.contains(item)) {
    items.add(item);
  }
  if (!item_link.contains(docs![item][1])) {
    item_link.add(docs[item][1]);
  }
  if (item_verified.length < items.length) {
    item_verified.add(docs[item][0]);
  }
}

lengthofitems() {
  return items.length;
}

icrement() {
  i++;
}
