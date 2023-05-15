import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context, String title) {
    return AppBar(
    centerTitle: true,
    title: Text(title),
    leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
    backgroundColor: const Color.fromARGB(255, 11, 41, 12),
  );
  }