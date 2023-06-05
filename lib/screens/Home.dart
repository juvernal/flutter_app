import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:testapp2/screens/About.dart';
import 'package:testapp2/screens/FichList.dart';
import 'package:testapp2/screens/plants.dart';
import 'package:testapp2/screens/settings.dart';
import 'package:testapp2/usefull/constantes.dart';
import '../providers/plant_provider.dart';
import '../usefull/Plant.dart';
import '../usefull/Utility.dart';
import '/screens/form.dart';
import '../bd/bd.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pagesIndex = 0;
  Constants constants = Constants();

  static const List<Widget> _widgetOptions = <Widget>[
    TheHome(),
    Plants(),
    Settings(),
    About(),
  ];

  static const List<Widget> _titleOptions = <Widget>[
    Text("KOAME PlantMed"),
    Text("Liste des plantes"),
    Text("Parametre"),
    Text("A propos"),
  ];

  void _setPageIndex(int index) {
    setState(() {
      _pagesIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: _titleOptions.elementAt(_pagesIndex),
        centerTitle: true,
        backgroundColor: constants.primaryColor,
      ),
      // bottomNavigationBar: const MyBottomAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            backgroundColor: constants.primaryColor,
            activeIcon: const Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.grass_outlined),
            activeIcon: const Icon(Icons.grass),
            backgroundColor: constants.primaryColor,
            label: "Plantes",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            backgroundColor: constants.primaryColor,
            label: "Parametres",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
            activeIcon: const Icon(Icons.info),
            backgroundColor: constants.primaryColor,
            label: "A Propos",
          ),
        ],
        currentIndex: _pagesIndex,
        onTap: _setPageIndex,
      ),
      body: _widgetOptions.elementAt(_pagesIndex),
    );
  }
}

// ==================================================================================================================
// ==================================================================================================================
// ==================================================================================================================
class TheHome extends StatefulWidget {
  const TheHome({super.key});

  @override
  State<TheHome> createState() => _TheHomeState();
}

class _TheHomeState extends State<TheHome> {
  List<Map<String, dynamic>> plantList = <Map<String, dynamic>>[];
  Constants constants = Constants();
  bool isloading = false;

  @override
  void initState() {
    // SqlHelper.deletetable();
    getdata();
    super.initState();
  }

  getdata() async {
    // final a = Provider.of<PlantProvider>(context, listen: false).plants;
    final a = await SqlHelper.getAllPlants();
    // plantList = a;
    setState(() {
      plantList = a;
      isloading = true;
      // plantList = plantList;
    }); //refresh UI after getting data from table.
  }

  FutureOr onGoBack(dynamic value) {
    getdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final list = context.watch<PlantProvider>().plants;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => const MyForm());
          Navigator.push(context, route).then(onGoBack);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return const MyForm();
          //   }),
          // );
        },
        backgroundColor: constants.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: isloading
              ? plantList.isEmpty
                  ? const Center(
                      heightFactor: 15.0,
                      child: Text(
                        "Welcome submit a new plant by pressing The PLUS button",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : Column(
                      children: plantList.map((plant) {
                        Plant pl = Plant(
                            description: plant["description"],
                            localisation: plant["localisation"],
                            nomScientifique: plant["nom_scientifique"],
                            nomVernaculaire: plant["nom_vernaculaire"],
                            photo: plant["photo"],
                            type: plant["type"],
                            id: plant["id"]);
                        return Card(
                          child: ListTile(
                            leading: Utility.imageFromBase64String(
                                plant["photo"] ?? ""),
                            title: Text(plant["nom_scientifique"]),
                            subtitle: Text(plant["type"]),
                            trailing: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    //call your onpressed function here
                                    Route route = MaterialPageRoute(
                                        builder: (context) => MyForm(
                                              plant: pl,
                                            ));
                                    Navigator.push(context, route)
                                        .then(onGoBack);
                                  },
                                  child: const Icon(Icons.edit),
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
                                        return alert(context, plant["id"]);
                                      },
                                    ).then(onGoBack);
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Plant pl = Plant(
                              //     description: plant["description"],
                              //     localisation: plant["localisation"],
                              //     nomScientifique: plant["nom_scientifique"],
                              //     nomVernaculaire: plant["nom_vernaculaire"],
                              //     photo: plant["photo"],
                              //     type: plant["type"],
                              //     id: plant["id"]);
                              Route r = MaterialPageRoute(
                                  builder: (context) => FichList(plant: pl));
                              Navigator.push(context, r).then(onGoBack);
                            },
                          ),
                        );
                      }).toList(),
                    )
              : Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: constants.primaryColor,
                      size: 100,
                    ),
                  ),
                ),
        ),
      ),
    );
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
        await SqlHelper.deletePlant(id);
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
      content: const Text("Are you sure that you want to delete this plant?"),
      actions: [
        cancelButton(context),
        deleteButton(context, id),
      ],
    );
  }
}
