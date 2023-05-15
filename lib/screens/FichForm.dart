import 'package:flutter/material.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:im_stepper/stepper.dart';

class FichForm extends StatefulWidget {
  const FichForm({super.key});

  @override
  State<FichForm> createState() => _FichFormState();
}

class _FichFormState extends State<FichForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Nouvelles fiches"),
      bottomNavigationBar: const MyBottomAppBar(),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            // scrollDirection: Axis.vertical,
            children: [

            ]
          ),
        ),
      ),
    );
  }
}