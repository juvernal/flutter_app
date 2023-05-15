import 'package:flutter/material.dart';

InputDecoration myInputDecoration(String label, IconData icon, Color color) {
    return  InputDecoration(
                  labelText: label,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  prefixIcon: Icon(
                    icon,
                    color: color,
                    ),
                    
                  );
  }