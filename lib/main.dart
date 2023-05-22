// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testapp2/bd/bd.dart';
import 'screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "KOAME PlantMed",
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}

class BdTest extends StatefulWidget {
  const BdTest({super.key});

  @override
  State<BdTest> createState() => _BdTestState();
}

class _BdTestState extends State<BdTest> {
  List<Map<String, dynamic>> _listPlants = [];
  bool _isLoading = true;
  final TextEditingController _nomScientifiqueController =
      TextEditingController();
  final TextEditingController _nomVernaculaireController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  void _refreshList() async {
    final data = await SqlHelper.getAllPlants();
    setState(() {
      _listPlants = data;
      _isLoading = false;
    });
  }

  Future<void> _addItem() async {
    await SqlHelper.addPlant(
        _nomScientifiqueController.text,
        _nomVernaculaireController.text,
        _descriptionController.text,
        _localisationController.text,
        _typeController.text);
    _refreshList();
    debugPrint("The list of items in database is ${_listPlants.length}");
  }

  Future<void> _updateItem(int id) async {
    await SqlHelper.updatePlant(
        id,
        _nomScientifiqueController.text,
        _nomVernaculaireController.text,
        _descriptionController.text,
        _localisationController.text,
        _typeController.text);
    _refreshList();
    debugPrint("The list of items in database is ${_listPlants.length}");
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _listPlants.firstWhere((element) => element['id'] == id);
      _nomScientifiqueController.text = existingJournal['nomScientifique'];
      _nomVernaculaireController.text = existingJournal['nomVernaculaire'];
      _descriptionController.text = existingJournal['description'];
      _localisationController.text = existingJournal['localisation'];
      _typeController.text = existingJournal['type'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nomScientifiqueController,
              decoration:
                  const InputDecoration(hintText: "Nom Scientifique ..."),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nomVernaculaireController,
              decoration:
                  const InputDecoration(hintText: "Nom Vernaculaire ..."),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: "Description ..."),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _localisationController,
              decoration: const InputDecoration(hintText: "Localisation ..."),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(hintText: "Type ..."),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addItem();
                }
                if (id != null) {
                  await _updateItem(id);
                }

                _nomScientifiqueController.text = '';
                _nomVernaculaireController.text = '';
                _descriptionController.text = '';
                _localisationController.text = '';
                _typeController.text = '';

                Navigator.of(context).pop();
              },
              child: Text(
                id == null ? "Creer une plante" : "Modifier une plante",
              ),
            ),
          ],
        ),
      ),
    );

    return;
  }

  void _deleteItem(int id) async {
    await SqlHelper.deleteItem(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Suppression reussie")));
    _refreshList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshList();
    debugPrint("The list of items in database is ${_listPlants.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.orange[300],
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(_listPlants[index]['nom_scientifique']),
            subtitle: Text(_listPlants[index]['nom_vernaculaire']),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _showForm(_listPlants[index]['id']),
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () => _deleteItem(_listPlants[index]['id']),
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: _listPlants.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _showForm(null);
          },
          child: const Icon(Icons.add)),
    );
  }
}
