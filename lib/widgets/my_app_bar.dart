import 'package:flutter/material.dart';
import 'package:koame_plantMed/usefull/constantes.dart';

AppBar myAppBar(BuildContext context, String title) {
  Constants constants = Constants();
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: constants.primaryColor,
  );
}
