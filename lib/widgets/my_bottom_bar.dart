import 'package:flutter/material.dart';
import 'package:testapp2/screens/Home.dart';

import '../screens/About.dart';
import '../screens/plants.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: const Color.fromARGB(255, 11, 41, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 IconButton(
                  icon: const Icon(Icons.home, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Home();
                    }));
                  },
                  ),
                const Text("Home", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 IconButton(
                  icon: const Icon(Icons.grass_outlined,color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Plants();
                    }));
                  },
                  ),
                const Text("Plantes", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 IconButton(
                  icon: const Icon(Icons.settings_applications_outlined, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return About();
                    }));
                  },
                  ),
                const Text("parametres", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0.0, top: 10.0, bottom: 10.0,),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return About();
                    }));
                  },
                  ),
                const Text("a propos", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

