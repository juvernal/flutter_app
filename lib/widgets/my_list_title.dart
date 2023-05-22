// import 'package:flutter/material.dart';
// import 'package:testapp2/screens/FichList.dart';

// class MyListTitle extends StatelessWidget {
//    MyListTitle({
//     super.key,
//     required this.photo,
//     required this.title,
//     required this.subtitle,
//     required this.trailing,
//     this.color = Colors.brown,
//   });

//   final String photo;
//   final Text title;
//   final Text subtitle;
//   final Text trailing;
//   final Color color;
//   final Function()? onTap = (){};

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(child: null, backgroundImage: AssetImage(photo) ),
//       title:  title,
//       subtitle:  subtitle,
//       trailing:  trailing,
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context){
//           return const FichList(null);
//         }), );
//       },
//       tileColor: color,
//     );
//   }
// }