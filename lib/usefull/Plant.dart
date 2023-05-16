// import 'DBhelp.dart';

class Plant{
  final int id;
  final String nomScientifique;
  final String nomVernaculaire;
  final String description;
  final String localisation;
  final String photo;
  final String type;
  Plant(
    {
      required this.id, 
      required this.nomScientifique, 
      required this.nomVernaculaire,
      required this.description,
      required this.localisation,
      required this.photo,
      required this.type
    }
    );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      // 'photo': photo,
      'nom_scientifique':nomScientifique,
      'nom_vernaculaire':nomVernaculaire,
      'description':description,
      'localisation':localisation,
      'type':type
    };
    return map;
  }


  @override
  String toString() {
    return 'Plant{id: $id, nomScientifique: $nomScientifique, nomVernaculaire: $nomVernaculaire, type: $type}';
  }
}