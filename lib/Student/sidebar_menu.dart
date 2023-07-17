// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Sidebar_menu extends StatefulWidget {
  const Sidebar_menu({super.key});

  @override
  State<Sidebar_menu> createState() => _Sidebar_menuState();
}

class _Sidebar_menuState extends State<Sidebar_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF17203A),
        width: 288,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(
                name: "Student Name",
                regno: "Regno.",
                icon: Icon(CupertinoIcons.person, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 1,
                  color: Colors.white,
                ),
              ),
              const NewWidget(
                name: "Home",
                icon: Icon(CupertinoIcons.person, color: Colors.white),
              ),
              const NewWidget(
                name: "Profile",
                icon: Icon(Icons.man),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.name,
    required this.icon,
  });
  final String name;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(CupertinoIcons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

//info card
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.regno,
    required this.icon,
  });
  final String name, regno;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: icon,
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        regno,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
