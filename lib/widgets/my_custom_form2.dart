import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:koame_plantMed/usefull/constantes.dart';
// import '../screens/Home.dart';
import '../usefull/Utility.dart';
import '../widgets/my_input_decoration.dart';
import '../usefull/Plant.dart';
import '../usefull/DBhelp.dart';
// import 'package:path_provider/path_provider.dart';
import '../bd/bd.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
// import '../usefull/Utility.dart';

class MyNewForm extends StatefulWidget {
  const MyNewForm({super.key, this.plant});
  final Plant? plant;
  @override
  State<MyNewForm> createState() => _MyNewFormState();
}

// class ApiImage {
//   final String imageUrl;
//   final String id;

//   ApiImage({
//     required this.imageUrl,
//     required this.id,
//   });
// }

class _MyNewFormState extends State<MyNewForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.plant != null) {
      loc.text = widget.plant!.localisation;
      sci.text = widget.plant!.nomScientifique;
      ver.text = widget.plant!.nomVernaculaire;
      desc.text = widget.plant!.description;
      type = widget.plant!.type;
    }
  }

  final _formKey = GlobalKey<FormBuilderState>();
  final bd = DBHelper();
  final database = SqlHelper();
  TextEditingController loc = TextEditingController();
  TextEditingController sci = TextEditingController();
  TextEditingController ver = TextEditingController();
  TextEditingController desc = TextEditingController();
  String? type = "";
  String? photo = "";
  File? pickedImage;
  Constants constants = Constants();

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 15, 82, 18),
                                    width: 5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: ClipOval(
                                  child: pickedImage != null
                                      ? Image.file(
                                          pickedImage!,
                                          width: 170,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        )
                                      : widget.plant != null
                                          ? SizedBox(
                                              width: 170,
                                              height: 170,
                                              child: Image(
                                                image: MemoryImage(Utility
                                                    .dataFromBase64String(
                                                        widget.plant!.photo)),
                                                fit: BoxFit.cover,
                                              ),
                                              // Utility.imageFromBase64String(
                                              //     widget.plant!.photo),
                                            )
                                          : SizedBox(
                                              width: 170,
                                              height: 170,
                                              child: Image.asset(
                                                "images/plante.jpg",
                                                fit: BoxFit.cover,
                                              ))),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 45.0,
                              child: IconButton(
                                onPressed: imagePickerOption,
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Color.fromARGB(255, 16, 87, 18),
                                  size: 40.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                  child: FormBuilderTextField(
                    name: "nom_scientifique",
                    onTap: () => sci.text = '',
                    controller: sci,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "entrer le nom scientifique";
                      }
                      return null;
                    },
                    // initialValue: widget.plant?.nomScientifique ?? "",

                    // validator: required,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "entrer le nom vernaculaire";
                      }
                      return null;
                    },
                    decoration: myInputDecoration(
                      "Nom vernaculaire",
                      FontAwesomeIcons.leaf,
                      const Color.fromARGB(255, 11, 41, 12),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 10.0, top: 20.0),
                child: DropdownButtonFormField(
                  // value: 'item1',null
                  value: widget.plant != null ? widget.plant!.type : null,
                  hint: const Text('type de plante'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'selectionner un type';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'typle de plante',
                      enabledBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      prefixIcon: Icon(
                        Icons.format_list_numbered_outlined,
                        color: constants.primaryColor,
                      )),
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                  dropdownColor: Colors.white,
                  items: const [
                    DropdownMenuItem(
                      enabled: true,
                      // activate(),
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
                    // validator: ,
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
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 15.0,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 133.0,
                    height: 50.0,
                    //  color: const Color.fromARGB(255, 11, 41, 12),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: constants.primaryColor,
                      ),
                      onPressed: () async {
                        // if (true) {
                        // XFile? img =
                        //     _formKey.currentState?.fields['photo']?.value;
                        if (!_formKey.currentState!.validate() &&
                            pickedImage == null) {
                          // debugPrint("")
                          return;
                        }
                        debugPrint("saving...");
                        String photo;
                        if (widget.plant == null) {
                          if (pickedImage == null) {
                            // final appDocDir =
                            //     await getApplicationDocumentsDirectory();
                            ByteData bytes =
                                (await rootBundle.load('images/plante.jpg'));
                            // String path = "${appDocDir.path}/images/plante.jpg";
                            // Uint8List bytes = File(path).readAsBytesSync();

                            photo = Utility.base64String(bytes as Uint8List);
                          } else {
                            photo = Utility.base64String(
                                await pickedImage!.readAsBytes());
                          }
                        } else {
                          photo = Utility.base64String(
                              Utility.dataFromBase64String(
                                  widget.plant!.photo));
                        }

                        Plant pl = Plant(
                          nomVernaculaire: ver.text,
                          nomScientifique: sci.text,
                          description: desc.text,
                          localisation: loc.text,
                          photo: photo,
                          type: type.toString(),
                        );
                        await SqlHelper.db();

                        if (widget.plant == null) {
                          debugPrint("saving");
                          int val = await SqlHelper.addPlant(pl);
                          debugPrint(val.toString());
                        } else {
                          pl.id = widget.plant!.id;
                          debugPrint("updating..");
                          // ignore: unused_local_variable
                          int val = await SqlHelper.updatePlant(pl);
                        }
                        // ignore: use_build_context_synchronously
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const Home();
                        // }));
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                        // ignore: use_build_context_synchronously
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const Home();
                        // }));
                        setState(() {});
                        // debugPrint(val.toString());
                        debugPrint(pl.toString());
                      },
                      child: Row(
                        children: [
                          widget.plant == null
                              ? const Icon(
                                  FontAwesomeIcons.floppyDisk,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  FontAwesomeIcons.upload,
                                  color: Colors.white,
                                ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          widget.plant == null
                              ? const Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                )
                              : const Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100.0,
                      height: 50.0,
                      //  color: const Color.fromARGB(255, 11, 41, 12),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          // fixedSize: const Size(15.0, 15.0),
                          backgroundColor: constants.primaryColor,
                        ),
                        onPressed: () {
                          debugPrint(photo);
                          _formKey.currentState!.reset();
                          SqlHelper.del();
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
                            Expanded(
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
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

  bool validation() {
    if (sci.text.isEmpty) {
      sci.text = "Entrer le nom scientifique ";
      // sci.value =  TextEditingValue();
      return false;
    } else if (ver.text.isEmpty) {
      sci.text = "Entrer le nom vernaculaire";
      return false;
    } else if (desc.text.isEmpty) {
      desc.text = "";
      return false;
    } else if (loc.text.isEmpty) {
      loc.text = "";
      return false;
    }
    return true;
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
