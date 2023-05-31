import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class ApiImage {
  final String imageUrl;
  final String id;

  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: FormBuilderImagePicker(
              name: 'singleAvatarPhoto',
              displayCustomType: (obj) => obj is ApiImage ? obj.imageUrl : obj,
              decoration: const InputDecoration(
                labelText: 'Plante Image',
              ),
              transformImageWidget: (context, displayImage) => Card(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox.expand(
                  child: displayImage,
                ),
              ),
              showDecoration: false,
              maxImages: 1,
              previewAutoSizeWidth: true,
              onSaved: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.leaf,
                      color: Color.fromARGB(255, 11, 41, 12)),
                  hintText: 'Entrer le nom scientifique de la plante',
                  labelText: 'Nom scientifique',
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon:
                      Icon(Icons.grass, color: Color.fromARGB(255, 11, 41, 12)),
                  hintText: 'Entrer le nom vernaculaire de la plante',
                  labelText: 'Nom vernaculaire',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 11, 41, 12),
                          width: 10.8,
                          style: BorderStyle.solid))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Color.fromARGB(255, 11, 41, 12),
                  ),
                  hintText: 'Entrer la zone geographie de la plante',
                  labelText: 'Localisation',
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 50.0,
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
                  onPressed: null,
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
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                width: 150.0,
                height: 50.0,
                //  color: const Color.fromARGB(255, 11, 41, 12),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 11, 41, 12),
                  ),
                  onPressed: null,
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.arrowsRotate,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "Renitialiser",
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
