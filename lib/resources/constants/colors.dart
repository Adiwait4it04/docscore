// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Gradient backgroundGradient() {
  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: const [
      Color(0xFF1F2C45),
      Color(0xFF274B93),
      Color(0XFF2A519D),
    ],
  );
}

Color ButtonColor() {
  return Color(0XffD9D9D9);
}
