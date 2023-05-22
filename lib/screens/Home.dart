import 'package:flutter/material.dart';
import 'package:testapp2/screens/About.dart';
import 'package:testapp2/screens/plants.dart';
import 'package:testapp2/screens/settings.dart';
import 'package:testapp2/usefull/constantes.dart';
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
  List<Map> plantList = [];
  Constants constants = Constants();

  @override
  void initState() {
    // SqlHelper.deletetable();
    getdata();
    super.initState();
  }

  getdata() async {
    final a = await SqlHelper.getAllPlants();
    setState(() {
      plantList = a;
    }); //refresh UI after getting data from table.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyForm();
            }),
          );
        },
        backgroundColor: constants.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: plantList.isEmpty
              ? const Text(
                  "Welcome submit a new plant by pressing T PLUS button")
              : Column(
                  children: plantList.map((plant) {
                    return Card(
                      child: ListTile(
                        leading:
                            Utility.imageFromBase64String(plant["photo"] ?? ""),
                        title: Text(plant["nom_scientifique"]),
                        subtitle: Text(plant["type"]),
                        trailing: const Text("0"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const MyForm();
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
