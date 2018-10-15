import 'package:flutter/material.dart';

import './ui/app.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: Colors.red
    ),
    title: "Score Keep",
    home: new App(),
  ));
}