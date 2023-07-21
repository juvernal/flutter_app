import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import '../bd/bd.dart';
// import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                SqlHelper.deletetable();
              },
              child: const Text("Reset plant table")),
          ElevatedButton(
              onPressed: () {
                debugPrint("reseting database");
                SqlHelper.del();
              },
              child: const Text("Reset database")),
        ],
      ),
    );
  }
}
