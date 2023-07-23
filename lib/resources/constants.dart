// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> items = [];
int i = 0;
int j = i++;

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
  );
}

additems(String item) {
  items.add(item);
}

lengthofitems() {
  return items.length;
}

icrement() {
  i++;
}
