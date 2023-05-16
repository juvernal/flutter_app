// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testapp2/bd/bd.dart';
// import 'screens/Home.dart';

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
      home: BdTest(),
    );
  }
}

class BdTest extends StatefulWidget {
  const BdTest({super.key});

  @override
  State<BdTest> createState() => _BdTestState();
}

class _BdTestState extends State<BdTest> {
  List<Map<String, dynamic>> _listItems = [];
  bool _isLoading = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _refreshList() async {
    final data = await SqlHelper.getItems();
    setState(() {
      _listItems = data;
      _isLoading = false;
    });
  }

  Future<void> _addItem() async {
    await SqlHelper.addItem(_nameController.text, _ageController.text);
    _refreshList();
    debugPrint("The list of items in database is ${_listItems.length}");
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _listItems.firstWhere((element) => element['id'] == id);
      _nameController.text = existingJournal['name'];
      _ageController.text = existingJournal['age'];
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
              controller: _nameController,
              decoration: const InputDecoration(hintText: "name"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(hintText: "age"),
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
                    // await _updateItem(id);
                  }

                  _nameController.text = "";
                  _ageController.text = "";

                  Navigator.of(context).pop();
                },
                child: Text(id == null ? "Create Dog" : "Update Dog")),
          ],
        ),
      ),
    );

    return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshList();
    debugPrint("The list of items in database is ${_listItems.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.orange[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(_listItems[index]['name']),
            subtitle: Text(_listItems[index]['age']),
          ),
        ),
        itemCount: _listItems.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _showForm(null);
          },
          child: const Icon(Icons.add)),
    );
  }
}
