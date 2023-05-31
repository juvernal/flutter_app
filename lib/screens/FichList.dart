import 'package:flutter/material.dart';
import 'package:testapp2/usefull/Plant.dart';
// import 'package:testapp2/main.dart';
import '../bd/bd.dart';
import '../usefull/Fiche.dart';
import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
// import '../screens/FichForm.dart';
import '../screens/fich_form2.dart';
import 'fiche_data.dart';

class FichList extends StatefulWidget {
  final Plant plant;
  // FichList(this.plantID);
  const FichList({required this.plant, super.key});

  @override
  State<FichList> createState() => _FichListState();
}

class _FichListState extends State<FichList> {
  List<Map> ficheList = [];
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
    }); //refresh UI after getting data from table.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Liste des fiches"),
      // bottomNavigationBar: const MyBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FichForm2(plant: widget.plant);
          }));
        },
        backgroundColor: const Color.fromARGB(255, 11, 41, 12),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ficheList.isEmpty
              ? const Text(
                  "Welcome submit a new plant by pressing T PLUS button")
              : Column(
                  children: ficheList.map((fiche) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.description_outlined),
                        title: Text("fiche ${fiche["id"]}: ${fiche["nom"]}"),
                        subtitle: Text(fiche["type_personne"]),
                        trailing: const Text("0 fiches"),
                        onTap: () {
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
                ),
        ),
      ),
    );
  }
}
