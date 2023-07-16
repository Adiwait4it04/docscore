import 'package:docscore/Student/student_home.dart';
import 'package:docscore/resources/constants.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle heading =
        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.20,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(gradient: backgroundGradient()),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                replaceScreen(
                                  context,
                                  Student_home_page(),
                                );
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white, size: 25),
                            ),
                            const Text(
                              "Profile",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 70,
                          width: 100,
                          child: Image.asset(
                            "assets/SRM_1.jpg",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.80,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.065,
                    ),
                    const Text(
                      "DARTHWIMP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Profile",
                          style: heading,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StudentProfileModels.profileText(
                                const Icon(Icons.numbers), "RA2111051010002"),
                            StudentProfileModels.profileText(
                                const Icon(Icons.numbers), "AB2"),
                            StudentProfileModels.profileText(
                                const Icon(Icons.numbers),
                                "B.Tech CSE with gaming technology"),
                            StudentProfileModels.profileText(
                                const Icon(Icons.numbers),
                                "fk2061@srmist.edu.in"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 25),
                            Text(
                              "Documents",
                              style: heading,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xffA2A7B8)),
                            child: const ListTile(
                              title: Text("Documents Uploaded"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xffA2A7B8)),
                            child: const ListTile(
                              title: Text("Documents yet to be Uploaded"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 25),
                            Text(
                              "Contact Us",
                              style: heading,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.email),
                            Text(
                              "   docscore@gmail.com",
                              style: heading,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StudentProfileModels {
  static Widget profileText(Icon reqIcon, String reqText) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [reqIcon],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(reqText)],
        )
      ],
    );
  }
}
