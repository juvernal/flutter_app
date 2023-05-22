import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../usefull/Fiche.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';
import 'package:im_stepper/stepper.dart';

class FichForm2 extends StatefulWidget {
  const FichForm2({super.key});

  @override
  State<FichForm2> createState() => _FichForm2State();
}

class _FichForm2State extends State<FichForm2> {
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 9;

  late Fiche fiche;
  bool initFiche = false;

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController lieu = TextEditingController();
  TextEditingController typeAliment = TextEditingController();

  String? gender;
  String? etat;
  String? recolte;
  String? age;
  String? sechage;
  String? preparation;

  String? q1;
  String? q2;
  static bool m1 = false,
      m2 = false,
      m3 = false,
      m4 = false,
      m5 = false,
      m6 = false,
      m7 = false,
      m8 = false,
      m9 = false,
      m10 = false,
      m11 = false,
      m12 = false;
  static List<bool> list = [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12];
  List<String> mals = [
    "Plaies",
    "Diarrhé",
    "Typhoide",
    "Mal d'estomac",
    "Hémorroide",
    "Paludisme",
    "Mal de yeux",
    "Mal de dents",
    "Problème de peau",
    "Mal de rate",
    "Fièvre",
    "mal de tete"
  ];
  List<String> maladies = [];
  String? q3;
  String? q4;
  String? q5;
  String? q6;
  String? q7;
  String? effet;
  String? materiel_vegetal;
  String? dure;
  String? emploi;
  String? dureTraitement;
  String? intox;
  String? consoEnfant;
  String? consoAdulte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "nouvelle fiche"),
      bottomNavigationBar: const MyBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              stepColor: const Color.fromARGB(255, 15, 65, 17),
              activeStepColor: Colors.orange,
              // enableNextPreviousButtons: false,
              // lineLength: 50.0,
              stepReachedAnimationEffect: Curves.decelerate,
              activeStepBorderWidth: 1.5,
              activeStepBorderColor: Colors.orange,
              icons: const [
                Icon(Icons.person),
                Icon(Icons.grass),
                Icon(Icons.question_mark),
                Icon(Icons.skip_next_outlined),
                Icon(Icons.skip_next_outlined),
                Icon(Icons.skip_next_outlined),
                Icon(Icons.skip_next_outlined),
                Icon(Icons.skip_next_outlined),
                Icon(Icons.check_circle),
              ],
              // activeStep property set to activeStep variable defined above.
              activeStep: activeStep,
              // This ensures step-tapping updates the activeStep.
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            header(),
            Expanded(child: content()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                nextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    switch (activeStep) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom complet',
                ),
              ),
              const Divider(),
              TextField(
                controller: lieu,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lieu',
                ),
              ),
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
                      activeColor: radioColor(),
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
                      activeColor: radioColor(),
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
                      activeColor: radioColor(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("15-18"),
                      activeColor: radioColor(),
                      value: "15-18",
                      groupValue: age,
                      onChanged: (value) {
                        setState(() {
                          age = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("18-25"),
                      activeColor: radioColor(),
                      value: "18-25",
                      groupValue: age,
                      onChanged: (value) {
                        setState(() {
                          age = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("25-45"),
                      activeColor: radioColor(),
                      value: "25-45",
                      groupValue: age,
                      onChanged: (value) {
                        setState(() {
                          age = value.toString();
                        });
                      },
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("45-75"),
                      activeColor: radioColor(),
                      value: "45-75",
                      groupValue: age,
                      onChanged: (value) {
                        setState(() {
                          age = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("75-100"),
                      activeColor: radioColor(),
                      value: "75-100",
                      groupValue: age,
                      onChanged: (value) {
                        setState(() {
                          age = value.toString();
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        );
      case 1:
        return SingleChildScrollView(
          child: Column(
            children: [
              if (initFiche) ...[result(fiche)]
            ],
          ),
        );
      case 2:
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              const Text(
                "Connaissez vous cette plante?",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("oui"),
                      value: "oui",
                      activeColor: radioColor(),
                      groupValue: q1,
                      onChanged: (value) {
                        setState(() {
                          q1 = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("non"),
                      value: "non",
                      groupValue: q1,
                      onChanged: (value) {
                        setState(() {
                          q1 = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(color: Color.fromARGB(255, 21, 85, 23)),
              if (q1 == "oui") ...[
                const Text(
                  "Quelles faites-vous de cette plante?",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Sacré pour le village"),
                        value: "Sacré pour le village",
                        activeColor: radioColor(),
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("non sacré pour le village"),
                        value: "non sacré pour le village",
                        groupValue: q2,
                        onChanged: (value) {
                          setState(() {
                            q2 = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.green,
                ),
                const Text(
                  "Quelles maladies soigne-t-elle?",
                  style: TextStyle(fontSize: 18),
                ),
                for (int i = 0; i < mals.length; i++) ...[
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(mals[i]),
                          activeColor: Colors.orange,
                          value: list[i],
                          onChanged: (value) {
                            setState(() {
                              list[i] = value ?? list[i];
                              getMaladies();
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ],
            ],
          ),
        );
      case 3:
        if (q1 == "oui") {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Quand doit-on récolter?",
                  style: TextStyle(fontSize: 18),
                ),
                // const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Saison de pluie"),
                        value: "Saison de pluie",
                        groupValue: recolte,
                        onChanged: (value) {
                          setState(() {
                            recolte = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Période indéfinie"),
                        value: "periiode indefinie",
                        groupValue: recolte,
                        onChanged: (value) {
                          setState(() {
                            recolte = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("saison sèche"),
                      value: "saison seche",
                      activeColor: radioColor(),
                      groupValue: recolte,
                      onChanged: (value) {
                        setState(() {
                          recolte = value.toString();
                          for (int i = 0; i < maladies.length; i++) {}
                        });
                      },
                    ),
                  ),
                ]),
                Divider(
                  color: Colors.green.shade900,
                  height: 9.0,
                ),
                const Text(
                  "Faut-il utiliser à l'état?",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Sec"),
                        value: "Sec",
                        groupValue: etat,
                        onChanged: (value) {
                          setState(() {
                            etat = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Calciné"),
                        value: "Calcine",
                        groupValue: etat,
                        onChanged: (value) {
                          setState(() {
                            etat = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Frais"),
                      value: "Frais",
                      activeColor: radioColor(),
                      groupValue: etat,
                      onChanged: (value) {
                        setState(() {
                          etat = value.toString();
                        });
                      },
                    ),
                  ),
                ]),
                Divider(
                  color: Colors.green.shade900,
                  height: 9.0,
                ),
                const Text(
                  "Comment procède-t-on au séchage?",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Au soleil"),
                        value: "au soleil",
                        groupValue: sechage,
                        onChanged: (value) {
                          setState(() {
                            sechage = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("A l'ombre"),
                        value: "a l'ombre",
                        groupValue: sechage,
                        onChanged: (value) {
                          setState(() {
                            sechage = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Sous la chaleur"),
                      value: "Sous la chaleur",
                      activeColor: radioColor(),
                      groupValue: sechage,
                      onChanged: (value) {
                        setState(() {
                          sechage = value.toString();
                        });
                      },
                    ),
                  ),
                ]),
                // const Divider(),
              ],
            ),
          );
        } else {
          return const Text("");
        }

      case 4:
        if (q1 == "oui") {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                const Text("Comment se faire la preparation?",
                    style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Par marcération à l'eau"),
                        value: "maceration eau",
                        activeColor: radioColor(),
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Par marcération alcoolique"),
                        value: "maceration alcoolique",
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Par décoction à l'eau"),
                        value: "decoction eau",
                        activeColor: radioColor(),
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Par decoction alcoolique"),
                        value: "decoction alcoolique",
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Par infusion à l'eau"),
                        value: "infusion eau",
                        activeColor: radioColor(),
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Par infusion alcoolique"),
                        value: "infusion alcoolique",
                        groupValue: preparation,
                        onChanged: (value) {
                          setState(() {
                            preparation = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const Divider(),
                const Text(
                    "Quelle quatité de matériel végétal faut-il prendre et dans quel volume d'eau?",
                    style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("1kg/5L"),
                        value: "1kg/5L",
                        activeColor: radioColor(),
                        groupValue: materiel_vegetal,
                        onChanged: (value) {
                          setState(() {
                            materiel_vegetal = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("2kg/5L"),
                        value: "2kg/5L",
                        groupValue: materiel_vegetal,
                        onChanged: (value) {
                          setState(() {
                            materiel_vegetal = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Pas moyen de savoir"),
                        value: "pas moyen de savoir",
                        activeColor: radioColor(),
                        groupValue: materiel_vegetal,
                        onChanged: (value) {
                          setState(() {
                            materiel_vegetal = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return const Text("");
        }
      case 5:
        if (q1 == "oui") {
          return SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 18.0,
              ),
              const Text("Durée de préparation?",
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("15min"),
                      value: "15min",
                      activeColor: radioColor(),
                      groupValue: preparation,
                      onChanged: (value) {
                        setState(() {
                          preparation = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("30min"),
                      value: "30min",
                      groupValue: preparation,
                      onChanged: (value) {
                        setState(() {
                          preparation = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("1h"),
                      value: "1h",
                      activeColor: radioColor(),
                      groupValue: dure,
                      onChanged: (value) {
                        setState(() {
                          dure = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("2h"),
                      value: "2h",
                      groupValue: dure,
                      onChanged: (value) {
                        setState(() {
                          dure = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text("Comment utilise-t-on la préparation?",
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Voie orale"),
                      value: "voie oral",
                      activeColor: radioColor(),
                      groupValue: emploi,
                      onChanged: (value) {
                        setState(() {
                          emploi = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("Voie anal"),
                      value: "voie anal",
                      groupValue: emploi,
                      onChanged: (value) {
                        setState(() {
                          emploi = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Pommade à l'huile de palme"),
                      value: "Pommade a l'huile",
                      activeColor: radioColor(),
                      groupValue: emploi,
                      onChanged: (value) {
                        setState(() {
                          emploi = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("Pommade au Meyanga"),
                      value: "Pommade au meyanga",
                      groupValue: emploi,
                      onChanged: (value) {
                        setState(() {
                          emploi = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text("Quelles est la durée du traitement?",
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Des jours"),
                      value: "des jours",
                      activeColor: radioColor(),
                      groupValue: dureTraitement,
                      onChanged: (value) {
                        setState(() {
                          dureTraitement = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("Des mois"),
                      value: "des mois",
                      groupValue: dureTraitement,
                      onChanged: (value) {
                        setState(() {
                          dureTraitement = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Des années"),
                      value: "des annees",
                      activeColor: radioColor(),
                      groupValue: dureTraitement,
                      onChanged: (value) {
                        setState(() {
                          dureTraitement = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: radioColor(),
                      title: const Text("Pas de durée"),
                      value: "pas de dure",
                      groupValue: dureTraitement,
                      onChanged: (value) {
                        setState(() {
                          dureTraitement = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              )
            ]),
          );
        } else {
          return const Text("");
        }
      case 6:
        if (q1 == "oui") {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                const Text(
                  "En cas d'intoxication comment procédé?",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Direction l'hopital"),
                        value: "direction l'hopital",
                        groupValue: intox,
                        onChanged: (value) {
                          setState(() {
                            intox = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Consommé du lait"),
                        value: "consommer du lait",
                        groupValue: intox,
                        onChanged: (value) {
                          setState(() {
                            intox = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Consommé de l'huile"),
                      value: "consommer de l'huile",
                      activeColor: radioColor(),
                      groupValue: intox,
                      onChanged: (value) {
                        setState(() {
                          intox = value.toString();
                        });
                      },
                    ),
                  ),
                ]),
                const Text(
                    "quels sont les effets secondaires liés au traitement?",
                    style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Vomissement"),
                        value: "vomissement",
                        activeColor: radioColor(),
                        groupValue: effet,
                        onChanged: (value) {
                          setState(() {
                            effet = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Vertiges"),
                        value: "vertiges",
                        groupValue: effet,
                        onChanged: (value) {
                          setState(() {
                            effet = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Fatigues"),
                        value: "fatigues",
                        activeColor: radioColor(),
                        groupValue: effet,
                        onChanged: (value) {
                          setState(() {
                            effet = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Faim intense"),
                        value: "faim intense",
                        groupValue: effet,
                        onChanged: (value) {
                          setState(() {
                            effet = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Fosses couches"),
                        value: "fosses couches",
                        groupValue: effet,
                        onChanged: (value) {
                          setState(() {
                            effet = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Text(
                    "Quel type d'aliment manger ou éviter pendant le traitement?",
                    style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: typeAliment,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "type d'alimemt",
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                )
              ],
            ),
          );
        } else {
          return const Text("");
        }
      case 7:
        if (q1 == "oui") {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                const Text(
                  "Quelle est la dose journalière?",
                  style: TextStyle(fontSize: 18.0),
                ),
                const Divider(),
                const Text("Enfant", style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("1-2mmS"),
                        value: "1-2mmS",
                        activeColor: radioColor(),
                        groupValue: consoEnfant,
                        onChanged: (value) {
                          setState(() {
                            consoEnfant = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("1verre mS"),
                        value: "1verre mS",
                        groupValue: consoEnfant,
                        onChanged: (value) {
                          setState(() {
                            consoEnfant = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("1verre mmS"),
                        value: "1verre mmS",
                        activeColor: radioColor(),
                        groupValue: consoEnfant,
                        onChanged: (value) {
                          setState(() {
                            consoEnfant = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("1verre par jour"),
                        value: "1verre par jour",
                        groupValue: consoEnfant,
                        onChanged: (value) {
                          setState(() {
                            consoEnfant = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Consommation sans limite"),
                        value: "consommation sans limite",
                        groupValue: consoEnfant,
                        onChanged: (value) {
                          setState(() {
                            consoEnfant = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Text("Adulte et Femme enceinte",
                    style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("1-2mmS"),
                        value: "1-2mmS",
                        activeColor: radioColor(),
                        groupValue: consoAdulte,
                        onChanged: (value) {
                          setState(() {
                            consoAdulte = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("1verre mS"),
                        value: "1verre mS",
                        groupValue: consoAdulte,
                        onChanged: (value) {
                          setState(() {
                            consoAdulte = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("1verre mmS"),
                        value: "1verre mmS",
                        activeColor: radioColor(),
                        groupValue: consoAdulte,
                        onChanged: (value) {
                          setState(() {
                            consoAdulte = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("1verre par jour"),
                        value: "1verre par jour",
                        groupValue: consoAdulte,
                        onChanged: (value) {
                          setState(() {
                            consoAdulte = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: radioColor(),
                        title: const Text("Consommation sans limite"),
                        value: "consommation sans limite",
                        groupValue: consoAdulte,
                        onChanged: (value) {
                          setState(() {
                            consoAdulte = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Text("");
        }
      case 8:
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18.0,
              ),
              Row(children: [
                label("Nom complet: ", 20.0),
                labelRep(name.text, 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Age: ", 20.0),
                labelRep(age ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Sexe: ", 20.0),
                labelRep(gender ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("lieu: ", 20.0),
                labelRep(lieu.text, 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                labelRep("Réponses Aux Questions", 26.0),
                // labelRep(gender ?? "vide", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Connaissez vous cette plante?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(q1 ?? "non", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Que faites-vous de cette plante?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(q2 ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelles maladies soigne-t-elle?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              for (int i = 0; i < maladies.length; i++) ...[
                labelRep(maladies[i], 19.0),
              ],
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quand doit-on récolter?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(recolte ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Faut-il utiliser à  l'état?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(etat ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment procède-t-on au séchage?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(sechage ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment se faire la préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(preparation ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quelle quantité de matériel végétal faut-il prendre et dans quel volume d'eau?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(materiel_vegetal ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Durée de préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(dure ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment utilise-t-on la préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(emploi ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la durée du traitement?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(dureTraitement ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("En cas d'intoxication comment procédé?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(intox ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quels sont les effets secondaires liés au traitements?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(effet ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quel type d'aliment manger ou éviter pendant le traitement?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(typeAliment.text, 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la dose journalière (Enfant)?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(consoEnfant ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la dose journalière (Adulte)?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(consoAdulte ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 82, 18))),
                    onPressed: () {
                      save();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.save, size: 32.0, color: Colors.white),
                        Text("Enregistrer",
                            style:
                                TextStyle(fontSize: 20, color: Colors.orange)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 17, 66, 18))),
                      onPressed: null,
                      child: Row(
                        children: const [
                          Icon(
                            size: 32.0,
                            FontAwesomeIcons.arrowsRotate,
                            color: Colors.white,
                          ),
                          Text("Renitialiser",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange))
                        ],
                      ))
                ],
              ),
            ],
          ),
        );
      default:
        return const Text("good bye");
    }
  }

  void save() {
    fiche = Fiche(
        nom: name.text,
        age: age,
        lieu: lieu.text,
        sex: gender,
        nomScientifique: "nomScientifique",
        nomVernaculaire: "nomVernaculaire",
        photo: "photo");
    initFiche = true;
  }

  Widget result(Fiche fich) {
    return Text(fich.toString());
  }

  Color radioColor() => Colors.orange;

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.orange)),
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          if (activeStep == 8) {
          } else {
            setState(() {
              activeStep++;
            });
          }
        }
      },
      child: const Text('Suiv'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.orange)),
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: const Text('Prec'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 15, 65, 17),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: const TextStyle(
                color: Color.fromARGB(255, 226, 152, 42),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String headerText() {
    switch (activeStep) {
      case 0:
        return " Information personel";
      case 1:
        return "Plante etudier";
      case 2:
        return "Debut du questionaire";
      case 8:
        return "Soumission du Questionaire";
      default:
        return "Suite du questionnaire";
    }
  }

  Widget questionLabel(String question) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 15, 65, 17),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget label(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.normal));
  }

  Widget labelRep(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.bold));
  }

  void getMaladies() {
    maladies = [];
    for (int i = 0; i < mals.length; i++) {
      if (list[i]) {
        // maladies[i] = mals[i];
        maladies.add(mals[i]);
      }
    }
  }
}
