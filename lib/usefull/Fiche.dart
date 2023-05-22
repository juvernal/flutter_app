class Fiche {
  //information de celui qui repond
  final String? nom;
  int? id;
  int? plantID;
  final String? age;
  final String? sex;
  final String? typePerson;
  String? lieu;

  Fiche(
      {this.id,
      this.plantID,
      required this.typePerson,
      required this.nom,
      required this.age,
      required this.sex,
      this.lieu,
      this.doseAdulte,
      this.doseEnfant,
      this.duree,
      this.dureTraitement,
      this.effetSecondaire,
      this.etat,
      this.intoxication,
      this.maladies,
      this.partie,
      this.periodeRecolte,
      this.preparation,
      this.quatiteMateriel,
      this.sacre,
      this.sechage,
      this.utilisation,
      this.typeAliment});
  //infomation du questionnaire
  // String? q1;
  String? sacre;
  String? typeAliment;
  String? maladies;
  String? partie;
  String? periodeRecolte;
  String? etat;
  String? sechage;
  String? preparation;
  String? quatiteMateriel;
  String? duree;
  String? utilisation;
  String? doseAdulte;
  String? doseEnfant;
  String? intoxication;
  String? dureTraitement;
  String? effetSecondaire;
  // String? partie;

  @override
  String toString() {
    // TODO: implement toString
    return "Fiche{nom: $nom, age: $age, lieu: $lieu, sexe: $sex, }";
  }
}
