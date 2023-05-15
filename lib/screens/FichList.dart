import 'package:flutter/material.dart';
import 'package:testapp2/main.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';
import '../screens/FichForm.dart';

class FichList extends StatefulWidget {
  const FichList({super.key});

  @override
  State<FichList> createState() => _FichListState();
}

class _FichListState extends State<FichList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Liste des fiches"),
      bottomNavigationBar: const MyBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const FichForm();
                    }));
        },
        backgroundColor: const Color.fromARGB(255, 11, 41, 12),
        child: const Icon(Icons.add),
      ),
    );
  }
}