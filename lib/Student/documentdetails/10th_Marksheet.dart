import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../resources/constants.dart';

class adddocs0 extends StatefulWidget {
  const adddocs0({super.key});

  @override
  State<adddocs0> createState() => _adddocs0State();
}

List<String> _sections = [
  "CBSE",
  "ICSE",
  "State Board",
  "Other",
];
String boards = "";

class _adddocs0State extends State<adddocs0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: backgroundGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text('10th Marksheet'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return "Select your section";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  errorBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  contentPadding: EdgeInsets.all(8.0),
                  filled: true,
                  fillColor: Colors.white,
                ),
                hint: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text("Select your Board"),
                ),
                items: _sections.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    boards = value!;
                  });
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    additems(
                      name[0],
                    );
                    buttonStates[0] = false;
                  },
                );
                replaceScreen(
                  context,
                  const Student_home_page(regno: "RA2111051010009"),
                );
              },
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF090F30),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Upload Document",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
