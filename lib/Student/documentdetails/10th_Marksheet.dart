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
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Upload details'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
