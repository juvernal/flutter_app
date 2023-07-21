// ignore_for_file: prefer_interpolation_to_compose_strings

// import 'dart:io';
// import 'dart:typed_data';

import 'dart:io';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';

//import for pdf exportation
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

import '../usefull/fiche.dart';
import '../usefull/Plant.dart';
import '../usefull/Utility.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_pdf_view.dart';

class FicheData extends StatelessWidget {
  final Fiche? fiche;
  final Plant plant;
  final doc = pw.Document();

  FicheData({this.fiche, required this.plant, super.key});
  Future<String> getFilePath() async {
    Directory? documentDirectory = await getExternalStorageDirectory();
    return "${documentDirectory?.path}/fiche_${fiche?.id}.pdf";
  }

  @override
  Widget build(BuildContext context) {
    List<String> maladies = fiche!.maladies!.split(";");

    return Scaffold(
        appBar: myAppBar(context, "fiche ${fiche!.id}".toUpperCase()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18.0,
              ),
              Row(children: [
                label("Nom complet: ", 20.0),
                labelRep(fiche!.nom ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Type de personne: ", 20.0),
                labelRep(fiche!.typePerson ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Age: ", 20.0),
                labelRep(fiche!.age ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Sexe: ", 20.0),
                labelRep(fiche!.sex ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("lieu: ", 20.0),
                labelRep(fiche!.lieu ?? "", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                labelRep("Réponses Aux Questions", 26.0),
                // labelRep(gender ?? "vide", 19.0),
              ]),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Connaissez vous cette plante?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep("oui", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Que faites-vous de cette plante?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.sacre ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelles maladies soigne-t-elle?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              for (int i = 0; i < maladies.length; i++) ...[
                labelRep(maladies[i], 19.0),
              ],
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelles parties récolter ?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.partie ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quand doit-on récolter?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.periodeRecolte ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Faut-il utiliser à  l'état?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.etat ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child: label("Comment procède-t-on au séchage?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.sechage ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Comment se faire la préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.preparation ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quelle quantité de matériel végétal faut-il prendre et dans quel volume d'eau?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.quatiteMateriel ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Durée de préparation?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.duree ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child:
                        label("Comment utilise-t-on la préparation?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.utilisation ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                label("Quelle est la durée du traitement?  ", 20.0),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.dureTraitement ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child: label(
                        "En cas d'intoxication comment procédé?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.intoxication ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quels sont les effets secondaires liés au traitements?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.effetSecondaire ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                  child: label(
                      "Quel type d'aliment manger ou éviter pendant le traitement?  ",
                      20.0),
                ),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.typeAliment ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child: label(
                        "Quelle est la dose journalière (Enfant)?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.doseEnfant ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(children: [
                Expanded(
                    child: label(
                        "Quelle est la dose journalière (Adulte)?  ", 20.0)),
                const SizedBox(height: 40.0)
              ]),
              labelRep(fiche!.doseAdulte ?? "", 19.0),
              const Divider(
                  color: Color.fromARGB(255, 14, 82, 16), height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 82, 18))),
                    onPressed: () {
                      // This is where we print the document
                      writePdf();
                      savepdf();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.print, size: 32.0, color: Colors.white),
                        Text("pdf",
                            style:
                                TextStyle(fontSize: 20, color: Colors.orange)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 17, 66, 18))),
                      onPressed: () async {
                        Directory? documentDirectory =
                            await getExternalStorageDirectory();
                        // print(
                        //     "${documentDirectory?.path}/fiche_${fiche?.id}.pdf");
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPdfViewer(
                                pdfPath:
                                    "${documentDirectory?.path}/fiche_${fiche?.id}.pdf"),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            size: 25.0,
                            FontAwesomeIcons.eye,
                            color: Colors.white,
                          ),
                          Text("Show",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange))
                        ],
                      ))
                ],
              ),
            ],
          ),
        ));
  }

  Widget label(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.normal));
  }

  Widget labelRep(String lab, double? s) {
    return Text(lab,
        style: TextStyle(fontSize: s, fontWeight: FontWeight.bold));
  }

  pw.Text pdfText(String lab, double? s, {PdfColor color = PdfColors.black}) {
    return pw.Text(lab, style: pw.TextStyle(fontSize: s, color: color));
  }

  writePdf() {
    List<String> maladies = fiche!.maladies!.split(";");
    // Create the Pdf document
    final plantImg = pw.MemoryImage(Utility.dataFromBase64String(plant.photo));
    // Add one page with centered text "Hello World"
    doc.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          // crossAxisAlignment: pw.CrossAxisAlignment.start,
          orientation: pw.PageOrientation.portrait,
          // crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          margin: const pw.EdgeInsets.all(50),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(
                  level: 0,
                  child: pw.Center(
                      child: pw.Text("fiche ${fiche?.id}",
                          style: const pw.TextStyle(
                              fontSize: 50, color: PdfColors.blue800)))),
              pw.Center(
                // level: 1,
                child: pw.Image(plantImg, width: 400, height: 400),
              ),
              pw.Center(
                child: pdfText("Nom scientifique: ${plant.nomScientifique}", 25,
                    color: PdfColors.green800),
              ),
              pw.Center(
                child: pdfText("Nom vernaculaire: ${plant.nomVernaculaire}", 25,
                    color: PdfColors.green800),
              ),
              pw.Center(
                child: pdfText("Type: ${plant.type}", 25,
                    color: PdfColors.green800),
              ),
              pw.Center(
                child: pdfText("Localisation: ${plant.localisation}", 25,
                    color: PdfColors.green800),
              ),
              pw.Center(
                child: pdfText("Description: ${plant.description}", 25,
                    color: PdfColors.green800),
              ),

              // pw.Shape()
              // pw.Header(child: pw.Text(''), level: 1),
              pw.Divider(
                color: PdfColors.blue800,
                borderStyle: pw.BorderStyle.solid,
                height: 10,
              ),

              pw.Header(
                  // level: 0,
                  child: pw.Center(
                      child: pw.Text("Information personnel",
                          style: pw.TextStyle(
                            color: PdfColors.yellow800,
                            fontBold: pw.Font.timesBold(),
                            fontSize: 50,
                          )))),
              pw.Center(
                child:
                    pdfText("Nom: ${fiche!.nom}", 25, color: PdfColors.blue800),
              ),
              pw.Center(
                child:
                    pdfText("Age: ${fiche!.age}", 25, color: PdfColors.blue800),
              ),
              pw.Center(
                child: pdfText("type: ${fiche!.typePerson}", 25,
                    color: PdfColors.blue800),
              ),
              pw.Center(
                child: pdfText("sexe: ${fiche!.sex}", 25,
                    color: PdfColors.blue800),
              ),
              pw.Center(
                child: pdfText("lieu: ${fiche!.lieu}", 25,
                    color: PdfColors.blue800),
              ),
              pw.Divider(
                color: PdfColors.blue800,
                borderStyle: pw.BorderStyle.solid,
                height: 10,
              ),
              pw.Header(
                  // level: 0,
                  child: pw.Center(
                      child: pw.Text("Réponses Aux Questions",
                          style: pw.TextStyle(
                            color: PdfColors.yellow800,
                            fontBold: pw.Font.timesBold(),
                            fontSize: 30,
                          )))),

              pw.Row(children: [
                pdfText("Connaissez vous cette plante?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText("oui", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText(
                    "Cette plante est elle sacrée pour le village?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.sacre ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Quelles maladies soigne-t-elle?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              for (int i = 0; i < maladies.length; i++) ...[
                pdfText(maladies[i], 19.0),
              ],
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Quelles parties récolter ?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.partie ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Quand doit-on récolter?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.periodeRecolte ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Faut-il utiliser à  l'état?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.etat ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                    child: pdfText("Comment procède-t-on au séchage?  ", 20.0)),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.sechage ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Comment se faire la préparation?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.preparation ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                  child: pdfText(
                      "Quelle quantité de matériel végétal faut-il prendre et dans quel volume d'eau?  ",
                      20.0),
                ),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.quatiteMateriel ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Durée de préparation?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.duree ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                    child: pdfText(
                        "Comment utilise-t-on la préparation?  ", 20.0)),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.utilisation ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pdfText("Quelle est la durée du traitement?  ", 20.0),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.dureTraitement ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                    child: pdfText(
                        "En cas d'intoxication comment procédé?  ", 20.0)),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.intoxication ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                  child: pdfText(
                      "Quels sont les effets secondaires liés au traitements?  ",
                      20.0),
                ),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.effetSecondaire ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                  child: pdfText(
                      "Quel type d'aliment manger ou éviter pendant le traitement?  ",
                      20.0),
                ),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.typeAliment ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                    child: pdfText(
                        "Quelle est la dose journalière (Enfant)?  ", 20.0)),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.doseEnfant ?? "", 19.0),
              pw.Divider(color: PdfColors.blue800, height: 50.0),
              pw.Row(children: [
                pw.Expanded(
                    child: pdfText(
                        "Quelle est la dose journalière (Adulte)?  ", 20.0)),
                pw.SizedBox(height: 40.0)
              ]),
              pdfText(fiche!.doseAdulte ?? "", 19.0),
            ];
          }),
    );
  }

  Future savepdf() async {
    Directory? documentDirectory = await getExternalStorageDirectory();
    final file = File("${documentDirectory?.path}/fiche_${fiche?.id}.pdf");
    if (file.existsSync()) {
      file.delete();
    }
    // String? documentPath = documentDirectory?.path;
    // print(documentPath);
    final pdfBytes = await doc.save();
    await file.writeAsBytes(pdfBytes.toList());

    // print("file saving...");
    DocumentFileSavePlus().saveMultipleFiles(
      dataList: [
        pdfBytes,
      ],
      fileNameList: [
        "fiche_${fiche?.id}.pdf",
      ],
      mimeTypeList: [
        "fiche_${fiche?.id}.pdf",
      ],
    );
  }
}
