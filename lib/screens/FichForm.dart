import 'package:flutter/material.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';

class FichForm extends StatefulWidget {
  const FichForm({super.key});

  @override
  State<FichForm> createState() => _FichFormState();
}

class _FichFormState extends State<FichForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Nouvelles fiches"),
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}