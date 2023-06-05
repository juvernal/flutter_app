import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:testapp2/usefull/Plant.dart';
// import 'package:testapp2/main.dart';
import '../bd/bd.dart';
import '../usefull/Fiche.dart';
import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
// import '../screens/FichForm.dart';
import '../screens/fich_form2.dart';
import 'fiche_data.dart';
import '../usefull/constantes.dart';

class FichList extends StatefulWidget {
  final Plant plant;
  // FichList(this.plantID);
  const FichList({required this.plant, super.key});

  @override
  State<FichList> createState() => _FichListState();
}

class _FichListState extends State<FichList> {
  List<Map> ficheList = [];
  bool isloading = true;
  Constants constants = Constants();
  @override
  void initState() {
    // SqlHelper.deletetable();
    getdata();
    super.initState();
  }

  getdata() async {
    final a = await SqlHelper.getPlantesFiche(widget.plant.id);
    setState(() {
      ficheList = a;
      isloading = false;
    }); //refresh UI after getting data from table.
  }

  FutureOr onGoBack(dynamic value) {
    getdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, "Liste des fiches"),
        // bottomNavigationBar: const MyBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route = MaterialPageRoute(
                builder: (context) => FichForm2(plant: widget.plant));
            Navigator.push(context, route).then(onGoBack);
          },
          backgroundColor: constants.primaryColor,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: !isloading
                ? ficheList.isEmpty
                    ? const Center(
                        heightFactor: 15.0,
                        child: Text(
                            "Welcome press the plus button to start a new research"),
                      )
                    : Column(
                        children: ficheList.map((fiche) {
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.description_outlined,
                                color: constants.primaryColor,
                              ),
                              title: Text(
                                "fiche ${fiche["id"]}: ${fiche["nom"]}",
                              ),
                              subtitle: Text(
                                fiche["type_personne"],
                                style: TextStyle(color: constants.primaryColor),
                              ),
                              trailing: Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: constants.primaryColor,
                                    ),
                                  ),
                                  const Text("plant"),
                                ],
                              ),
                              onTap: () {
                                debugPrint(ficheList.length.toString());
                                Fiche fich = Fiche(
                                    age: fiche["age"],
                                    nom: fiche["nom"],
                                    sex: fiche["sexe"],
                                    typePerson: fiche["type_personne"],
                                    doseAdulte: fiche["dose_adulte"],
                                    doseEnfant: fiche["dose_enfant"],
                                    dureTraitement: fiche["dure_traitement"],
                                    duree: fiche["dure_preparation"],
                                    effetSecondaire: fiche["effet_secondaire"],
                                    etat: fiche["etat"],
                                    intoxication: fiche["intoxication"],
                                    lieu: fiche["lieu"],
                                    maladies: fiche["maladies"],
                                    partie: fiche["partie"],
                                    periodeRecolte: fiche["periode_recolte"],
                                    plantID: fiche["plant_id"],
                                    preparation: fiche["preparation"],
                                    quatiteMateriel: fiche["quantite_materiel"],
                                    sacre: fiche["sacre"],
                                    sechage: fiche["sechage"],
                                    typeAliment: fiche["type_aliment"],
                                    utilisation: fiche["utilisation"],
                                    id: fiche["id"]);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FicheData(fiche: fich);
                                }));
                              },
                            ),
                          );
                        }).toList(),
                      )
                : Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: constants.primaryColor,
                        size: 100,
                      ),
                    ),
                  ),
          ),
        ));
  }
}
