import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Colors.white;
const secondaryColor = Colors.deepPurple;

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

Gradient backgroundGradient() {
  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: const [
      Color(0xFF1F2C45),
      Color(0xFF274B93),
      Color(0xFF2A519D),
    ],
  );
}

Color ButtonColor() {
  return Color(0xffD9D9D9);
}
