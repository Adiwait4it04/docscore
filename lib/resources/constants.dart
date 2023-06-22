import 'package:flutter/material.dart';

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
