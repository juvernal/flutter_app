import 'package:flutter/material.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';
// import 'package:group_radio_button/group_radio_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:im_stepper/stepper.dart';

class FichForm extends StatefulWidget {
  const FichForm({super.key});

  @override
  State<FichForm> createState() => _FichFormState();
}

class _FichFormState extends State<FichForm> {
  String? gender;
  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          // subtitle: const Text("information sur celui qui repond "),
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Utilisateur'),
          content: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom complet',
                ),
              ),
              // const SizedBox(
              //   height: 8.0,
              // ),
              const Divider(),
              const Text(
                "Sexe",
                style: TextStyle(fontSize: 18),
              ),
              // const Divider(),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("M"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("F"),
                      value: "femme",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("A"),
                      value: "other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  )
                ],
              ),
              const Divider(),
              const Text(
                "Age",
                style: TextStyle(fontSize: 18),
              ),
              RadioListTile(
                title: const Text("15-18"),
                value: "a1",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text("18-25"),
                value: "a2",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text("25-45"),
                value: "a3",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("45-70"),
                value: "a3",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("70-100"),
                value: "a3",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text("Debut du formulaire"),
            content: const Center(
              child: Text("Hello"),
            )),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Plante'),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full House Address',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pincode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pin Code',
                  ),
                ),
              ],
            )),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Confirm'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Text('Name: ${name.text}'),
            Text('Email: ${age.text}'),
            Text('Password: ${pass.text}'),
            Text('Address : ${address.text}'),
            Text('PinCode : ${pincode.text}'),
              ],
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "nouvelle fiche"),
      bottomNavigationBar: const MyBottomAppBar(),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
