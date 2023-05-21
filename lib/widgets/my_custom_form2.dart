import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/Home.dart';
import '../widgets/my_input_decoration.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import '../usefull/Plant.dart';
import '../usefull/DBhelp.dart';
import '../bd/bd.dart';
// import '../usefull/Utility.dart';

class MyNewForm extends StatefulWidget {
  const MyNewForm({super.key});

  @override
  State<MyNewForm> createState() => _MyNewFormState();
}

class ApiImage {
  final String imageUrl;
  final String id;

  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

class _MyNewFormState extends State<MyNewForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final bd = DBHelper();
  final database = SqlHelper();
  TextEditingController loc = TextEditingController();
  TextEditingController sci = TextEditingController();
  TextEditingController ver = TextEditingController();
  TextEditingController desc = TextEditingController();
  String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                child: FormBuilderImagePicker(
                  name: 'photos',
                  displayCustomType: (obj) =>
                      obj is ApiImage ? obj.imageUrl : obj,
                  decoration: const InputDecoration(
                      labelText: 'IMAGE DE LA PLANTE',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 41, 12),
                      )),
                  transformImageWidget: (context, displayImage) => Card(
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox.expand(
                      child: displayImage,
                    ),
                  ),
                  showDecoration: true,
                  maxImages: 1,
                  previewAutoSizeWidth: true,
                  onSaved: null,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                  child: FormBuilderTextField(
                    name: "nom_scientifique",
                    controller: sci,
                    decoration: myInputDecoration(
                        "Nom scientifique",
                        Icons.grass_outlined,
                        const Color.fromARGB(255, 11, 41, 12)),
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(errorText: "Entrer le nom scientifique")
                    // ]),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                  child: FormBuilderTextField(
                    name: "nom_vernaculaire",
                    controller: ver,
                    decoration: myInputDecoration(
                      "Nom vernaculaire",
                      FontAwesomeIcons.leaf,
                      const Color.fromARGB(255, 11, 41, 12),
                    ),
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(errorText: "Entrer le nom vernaculaire")
                    // ]),
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                child: DropdownButtonFormField(
                  // value: 'item1',
                  hint: const Text('type de plante'),
                  decoration: const InputDecoration(
                      labelText: 'typle de plante',
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      prefixIcon: Icon(
                        Icons.format_list_numbered_outlined,
                        color: Color.fromARGB(255, 11, 41, 12),
                      )),
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                  dropdownColor: Colors.white,
                  items: const [
                    DropdownMenuItem(
                      value: 'arbre',
                      child: Text('Arbre'),
                    ),
                    DropdownMenuItem(
                      value: 'herbe',
                      child: Text('herbe'),
                    ),
                    DropdownMenuItem(
                      value: 'liane',
                      child: Text('liane'),
                    ),
                  ],
                  // validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(errorText: "Selectionner un type")
                  //   ]),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                  child: FormBuilderTextField(
                    name: "description",
                    controller: desc,
                    decoration: myInputDecoration(
                      "Description de la plante",
                      FontAwesomeIcons.info,
                      const Color.fromARGB(255, 11, 41, 12),
                    ),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                  child: FormBuilderTextField(
                    name: "localisation",
                    controller: loc,
                    decoration: myInputDecoration(
                      "Localisation",
                      FontAwesomeIcons.mapLocation,
                      const Color.fromARGB(255, 11, 41, 12),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  height: 20.0,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 145.0,
                    height: 50.0,
                    //  color: const Color.fromARGB(255, 11, 41, 12),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 11, 41, 12),
                      ),
                      onPressed: () async {
                        if (true) {
                          Plant pl = Plant(
                            nomVernaculaire: ver.text,
                            nomScientifique: sci.text,
                            description: desc.text,
                            localisation: loc.text,
                            photo: 'photo',
                            type: type.toString(),
                          );
                          // Image file = _formKey.currentState!.value['photos'];
                          // String photo_name = Utility.base64String(await );
                          await SqlHelper.db();
                          int val = await SqlHelper.addPlant(pl);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                          debugPrint(val.toString());
                          debugPrint(pl.toString());
                        }
                      },
                      child: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.floppyDisk,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Enregistrer",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 140.0,
                    height: 50.0,
                    //  color: const Color.fromARGB(255, 11, 41, 12),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 11, 41, 12),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                        // SqlHelper.deletetable();
                      },
                      child: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.arrowsRotate,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Text(
                            "Renitialiser",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
