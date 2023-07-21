import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:provider/provider.dart';
import 'package:koame_plantMed/bd/bd.dart';
import '../usefull/Utility.dart';
import '../usefull/constantes.dart';
// import '../widgets/my_app_bar.dart';
// import '../widgets/my_bottom_bar.dart';
// import '../providers/plant_provider.dart';

class Plants extends StatefulWidget {
  const Plants({super.key});

  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  List<Map<String, dynamic>> plantList = <Map<String, dynamic>>[];
  Constants constants = Constants();
  bool isloading = true;
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
      isloading = false;
      // plantList = plantList;
    }); //refresh UI after getting data from table.
  }

  @override
  Widget build(BuildContext context) {
    // final a = Provider.of<PlantProvider>(context, listen: false).plants;
    // plantList = getdata();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 104, 9),
      body: Center(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              child: !isloading
                  ? plantList.isEmpty
                      ? const Center(
                          heightFactor: 15.0,
                          child: Text(
                            "Welcome there is no plant yet please submit a \nnew plant",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Row(
                          children: plantList.map((plant) {
                            return Card(
                              child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  constraints: const BoxConstraints.expand(
                                    width: 300.0,
                                    height: 450.0,
                                  ),
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                146, 114, 238, 114),
                                            offset: Offset(0, 1),
                                            spreadRadius: 5.0,
                                            blurRadius: 10.0)
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 4, 39, 1),
                                              width: 5),
                                          // borderRadius: const BorderRadius.all(
                                          //   Radius.circular(100),
                                          // ),
                                        ),
                                        height: 500.0,
                                        alignment: Alignment.center,
                                        child: Image(
                                          image: MemoryImage(
                                              Utility.dataFromBase64String(
                                                  plant["photo"])),
                                          fit: null,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 50.0,
                                        left: 0.0,
                                        child: Text(
                                          "Scientifique: ${plant["nom_scientifique"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              backgroundColor:
                                                  constants.primaryColor,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      Positioned(
                                        top: 35.0,
                                        right: 50.0,
                                        left: 0.0,
                                        child: Text(
                                          "vernaculaire: ${plant["nom_vernaculaire"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              backgroundColor:
                                                  constants.primaryColor,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      Positioned(
                                        right: 180,
                                        bottom: 120.0,
                                        child: Text(
                                          "Type: ${plant["type"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              backgroundColor:
                                                  constants.primaryColor,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      const Positioned(
                                          right: 0.0,
                                          bottom: 120.0,
                                          left: 200.0,
                                          child: TextButton(
                                              onPressed: null,
                                              child: Text("Voir"))),
                                    ],
                                  )),
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
          ],
        ),
      )),
    );
  }
}
