import 'package:flutter/material.dart';
// import 'package:testapp2/screens/Home.dart';
// import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
// import '../bd/bd.dart';

class About extends StatelessWidget {
  const About({super.key});
  // String product_name;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Koame Plant by Koame fondation.",
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
