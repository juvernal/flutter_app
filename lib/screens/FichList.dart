// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:koame_plantMed/usefull/Plant.dart';
// import 'package:testapp2/main.dart';
import '../bd/bd.dart';
import '../usefull/fiche.dart';
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
                builder: (context) => FichForm2(
                      plant: widget.plant,
                      // fich: null,
                    ));
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
                          Fiche f = Fiche(
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
                              id: fiche["id"],
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
                              utilisation: fiche["utilisation"]);
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
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) => FichForm2(
                                                plant: widget.plant,
                                                fich: f,
                                              ));
                                      Navigator.push(context, route)
                                          .then(onGoBack);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: constants.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //call your onpressed function here
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert(context, fiche["id"]);
                                        },
                                      ).then(onGoBack);
                                      setState(() {});
                                    },
                                    child: const Icon(Icons.delete,
                                        color: Color.fromARGB(255, 160, 17, 7)),
                                  ),
                                  // const Text("plant"),
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
                                Route route = MaterialPageRoute(
                                    builder: (context) => FicheData(
                                        fiche: fich, plant: widget.plant));
                                Navigator.push(context, route);
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

  static Widget cancelButton(BuildContext context) {
    return TextButton(
      child: const Text(
        "cancel",
        style: TextStyle(color: Color.fromARGB(255, 9, 150, 216)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  static Widget deleteButton(BuildContext context, int id) {
    return TextButton(
      child: const Text(
        "delete",
        style: TextStyle(color: Color.fromARGB(255, 206, 7, 7)),
      ),
      onPressed: () async {
        await SqlHelper.deleteFiche(id);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        debugPrint("sucessfull delete");
      },
    );
  }

  AlertDialog alert(BuildContext context, int id) {
    return AlertDialog(
      title: Row(
        children: const [
          Icon(Icons.dangerous, color: Color.fromARGB(255, 206, 7, 7)),
          Text(
            "Attention!!",
            style: TextStyle(color: Color.fromARGB(255, 206, 7, 7)),
          )
        ],
      ),
      content: const Text("Are you sure that you want to delete this fich?"),
      actions: [
        cancelButton(context),
        deleteButton(context, id),
      ],
    );
  }
}
