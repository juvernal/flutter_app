class Fiche {
  //information de celui qui repond
  final String? nom;
  final String? age;
  final String? sex;
  String? lieu;

  // information sur la plante
  final String? nomScientifique;
  final String? nomVernaculaire;
  final String? photo;
  Fiche(
      {required this.nom,
      required this.age,
      required this.sex,
      required this.nomScientifique,
      required this.nomVernaculaire,
      required this.photo,
      this.lieu,
      this.q1,
      this.q2,
      this.q3,
      this.q4,
      this.q5,
      this.q6,
      this.q7,
      this.q8,
      this.q9,
      this.q10,
      this.q11,
      this.q12,
      this.q13,
      this.q14,
      this.q15,
      this.q16});
  //infomation du questionnaire
  String? q1;
  String? q2;
  List<String>? q3;
  String? q4;
  String? q5;
  String? q6;
  String? q7;
  String? q8;
  String? q9;
  String? q10;
  String? q11;
  String? q12;
  String? q13;
  String? q14;
  String? q15;
  String? q16;
  String? q17;

  @override
  String toString() {
    // TODO: implement toString
    return "Fiche{nom: $nom, age: $age, lieu: $lieu, sexe: $sex, }";
  }
}
