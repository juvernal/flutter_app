import 'package:flutter/material.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_bar.dart';

class Plants extends StatelessWidget {
  const Plants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 39, 26),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints.expand(width: 330.0, height: 450.0),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.white24,
                    offset: Offset(0, 2),
                    spreadRadius: 5,
                    blurRadius: 10)
              ],
              image: DecorationImage(
                  image: AssetImage('images/foot.png'), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Stack(
            children: const [
              Text(
                "text 1",
                style: TextStyle(color: Colors.white70, fontSize: 18.0),
              ),
              Positioned(
                top: 15.0,
                child: Text(
                  "text 1",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 0.0,
                child: Text(
                  "text 1",
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Text(
                  "text 1",
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
