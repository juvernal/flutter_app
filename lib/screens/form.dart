import 'package:flutter/material.dart';
import '../usefull/Plant.dart';
import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../widgets/my_custom_form2.dart';
// import '../widgets/my_custom_form.dart';
// import 'About.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key, this.plant});
  final Plant? plant;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Nouvelle plante".toUpperCase()),
      body: MyNewForm(
        plant: widget.plant,
      ),
    );
  }
}
