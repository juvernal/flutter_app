import 'package:flutter/material.dart';
// import 'package:testapp2/screens/Home.dart';
import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
import '../bd/bd.dart';

class About extends StatelessWidget {
  const About({super.key});
  // String product_name;
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
