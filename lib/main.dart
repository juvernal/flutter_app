// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testapp2/bd/bd.dart';
import 'screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KOAME PlantMed",
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}
