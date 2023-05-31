import 'package:flutter/material.dart';
import 'package:testapp2/usefull/constantes.dart';

AppBar myAppBar(BuildContext context, String title) {
  Constants constants = Constants();
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: constants.primaryColor,
  );
}
