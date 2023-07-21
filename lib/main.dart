// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'providers/plant_provider.dart';
import 'screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider<PlantProvider>(
    child: const MyApp(),
    create: (_) => PlantProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KOAMES PlantMed",
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}
