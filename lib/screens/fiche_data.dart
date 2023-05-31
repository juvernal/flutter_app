import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../usefull/Fiche.dart';
import '../widgets/my_app_bar.dart';

class FicheData extends StatelessWidget {
  final Fiche? fiche;
  const FicheData({this.fiche, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> maladies = fiche!.maladies!.split(";");
    return Scaffold(
        appBar: myAppBar(context, "Nouvelle plante".toUpperCase()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18.0,
              ),
              Row(children: [
                label("Nom complet: ", 20.0),
                labelRep(fiche!.nom ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Type de personne: ", 20.0),
                labelRep(fiche!.typePerson ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Age: ", 20.0),
                labelRep(fiche!.age ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Sexe: ", 20.0),
                labelRep(fiche!.sex ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("lieu: ", 20.0),
                labelRep(fiche!.lieu ?? "", 19.0),
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
              labelRep("oui", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Que faites-vous de cette plante?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.sacre ?? "", 19.0),
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
                label("Quelles parties récolter ?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.partie ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quand doit-on récolter?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.periodeRecolte ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Faut-il utiliser à  l'état?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.etat ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment procède-t-on au séchage?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.sechage ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment se faire la préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.preparation ?? "", 19.0),
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
              labelRep(fiche!.quatiteMateriel ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Durée de préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.duree ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment utilise-t-on la préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.utilisation ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la durée du traitement?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.dureTraitement ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child: label(
                        "En cas d'intoxication comment procédé?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.intoxication ?? "", 19.0),
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
              labelRep(fiche!.effetSecondaire ?? "", 19.0),
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
              labelRep(fiche!.typeAliment ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la dose journalière (Enfant)?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.doseEnfant ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la dose journalière (Adulte)?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.doseAdulte ?? "", 19.0),
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
                      // save();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.save, size: 32.0, color: Colors.white),
                        Text("Edit",
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
                          Text("Delete",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange))
                        ],
                      ))
                ],
              ),
            ],
          ),
        ));
  }

  Widget label(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.normal));
  }

  Widget labelRep(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.bold));
  }
}
