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
        child: const SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Student Name",
                regno: "Regno.",
              ),
              ListTile(
                leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: RiveAnimation.asset("assets")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.regno,
  });
  final String name, regno;
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
      subtitle: Text(
        regno,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
