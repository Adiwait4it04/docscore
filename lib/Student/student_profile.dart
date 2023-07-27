import 'package:docscore/Student/add_docs.dart';
import 'package:docscore/Student/student_home.dart';
import 'package:docscore/Student/student_login.dart';
import 'package:docscore/resources/constants.dart';
import 'package:docscore/resources/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore/models/users.dart' as user_model;

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  late Future<Map<String, dynamic>> _studentData;

  @override
  void initState() {
    super.initState();
    _studentData = user_model.User().getStudentData();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextStyle heading =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _studentData,
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: const CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                Map<String, dynamic> data = snapshot.data!;
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SafeArea(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(gradient: backgroundGradient()),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
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
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            width: MediaQuery.of(context).size.width,
                            decoration:
                                const BoxDecoration(color: Color(0xffD9D9D9)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.065,
                                  ),
                                  Text(
                                    data["name"],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
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
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StudentProfileModels.profileText(
                                              const Icon(Icons.school),
                                              data['regno']),
                                          StudentProfileModels.profileText(
                                              const Icon(Icons.class_outlined),
                                              data['section']),
                                          StudentProfileModels.profileText(
                                              const Icon(Icons.mail),
                                              data['mail']),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const SizedBox(width: 25),
                                          Text(
                                            "Documents",
                                            style: heading,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            replaceScreen(
                                                context, Student_home_page());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: const Color(0xffA2A7B8)),
                                            child: const ListTile(
                                              title: Text("Documents Uploaded"),
                                              trailing:
                                                  Icon(Icons.arrow_forward_ios),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            replaceScreen(
                                                context, const adddocs());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: const Color(0xffA2A7B8)),
                                            child: const ListTile(
                                              title: Text(
                                                  "Documents yet to be Uploaded"),
                                              trailing:
                                                  Icon(Icons.arrow_forward_ios),
                                            ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.email),
                                          Text(
                                            "   docscore@gmail.com",
                                            style: heading,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            _auth.signOut();
                                            nextScreen(
                                                context, StudentLoginPage());
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    230, 215, 34, 31),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Center(
                                                child: Text(
                                              "Logout",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
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
            },
          ),
        ),
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
