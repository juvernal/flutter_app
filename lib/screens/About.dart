import 'package:flutter/material.dart';
import 'package:testapp2/screens/Home.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';

class About extends StatelessWidget {
   About({super.key});
  // String product_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "A propos"),
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
