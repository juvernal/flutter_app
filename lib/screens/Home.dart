
import 'package:flutter/material.dart';
// import 'package:testapp2/screens/About.dart';
// import 'package:testapp2/screens/plants.dart';
import '/screens/form.dart';

import '../widgets/my_bottom_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/my_list_title.dart';
import '../usefull/Plant.dart';
import '../usefull/DBhelp.dart';


class Home extends StatefulWidget {
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bd = DBHelper();
   List <Plant> plantList=[
    
   ];
  //  bool _isLoading = true;
  //  void _refreshPlants() async{
  //   final data = await bd.plants();
  //   // debugPrint();
  //   setState(() {
  //     _plantList = data;
  //     _isLoading = false;
  //   });
  //  }
  @override
  void initState() {
    super.initState();
    // _refreshPlants(); 
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
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const MyForm();
                    }));
        },
        backgroundColor: const Color.fromARGB(255, 11, 41, 12),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 2.0, left: 3.0, right: 3.0,),
        itemCount: plantList.length,
        itemBuilder: ((context, index) {
         return  Padding(
           padding: const EdgeInsets.only(bottom: 3.0),
           child: MyListTitle(
              photo: plantList[index].photo, 
              title:  Text(plantList[index].nomScientifique, style: const TextStyle(color: Colors.white, fontSize: 20.0),), 
              subtitle:  Text(plantList[index].description, style: const TextStyle(color: Colors.white, fontSize: 15.0),),  
              trailing:  const Text("0", style: TextStyle(color: Colors.white, fontSize: 22.0),),  
              color:  const Color.fromARGB(255, 1, 87, 23),
            ),
         );
        }),
        
      ),
    );
  }
}



