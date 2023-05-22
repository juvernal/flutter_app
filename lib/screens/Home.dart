import 'package:flutter/material.dart';
import '../usefull/Utility.dart';
import '/screens/form.dart';
import '../widgets/my_bottom_bar.dart';
import '../bd/bd.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> plantList = [];

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
        appBar: AppBar(
          leading: null,
          title: const Text("KOAME PlantMed"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 11, 41, 12),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MyForm();
            }));
          },
          backgroundColor: const Color.fromARGB(255, 11, 41, 12),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Container(
              child: plantList.isEmpty
                  ? const Text(
                      "Welcome submit a new plant by pressing T PLUS button")
                  : Column(
                      children: plantList.map((plant) {
                        return Card(
                          child: ListTile(
                            leading: Utility.imageFromBase64String(
                                plant["photo"] ?? ""),
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
                    )),
        ));
  }
}
