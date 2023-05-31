import 'package:flutter/material.dart';

import '../usefull/Plant.dart';
import '../bd/bd.dart';

// final initialData = SqlHelper.getAllPlants();

getdata() async {
  return await SqlHelper.getAllPlants();
}

// final List<Map> plantList = getdata();

class PlantProvider with ChangeNotifier {
  List<Map<String, dynamic>> _plantList = getdata();
  // final _plants = getdata();
  // _plantList = getdata();
  List<Map<String, dynamic>> plants() => _plantList;
  void setPlants(List<Map<String, dynamic>> plant) {
    _plantList = plant;
  }
}
