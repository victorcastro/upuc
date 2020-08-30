import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upuc/components/customShapeClipper.dart';
import 'package:upuc/screens/typecare.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _fullname;
  String _address;
  String _documentNumber;
  String _phone;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _addDataToFirebase() {
    Map<String, dynamic> data = {
      'fullname': _fullname,
      'document': _documentNumber,
      'address' : _address,
      'phone' : _phone
    };

    CollectionReference donations = FirebaseFirestore.instance.collection('donaciones');
    donations.add(data);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TypeCareScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar apoyo'),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF0F0F0),
      resizeToAvoidBottomPadding: false,
      body: Stack(
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(height: 130, color: Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                  child: Column(
                    children: [
                      Text('Déjanos tus datos y nos podremos en contacto contigo para brindarte la ayuda que necesitas', style: TextStyle(color: Colors.white, height: 1.7), textAlign: TextAlign.center),
                      SizedBox(height: 80),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Nombres completos',
                        ),
                        validator: (String value) {
                          print(value);
                          return (value.isEmpty)  ? 'Campo obligatorio' : null;
                        },
                        onSaved: (String value) {
                          _fullname = value;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_city),
                          labelText: 'Dirección',
                        ),
                        validator: (String value) {
                          print(value);
                          return (value.isEmpty)  ? 'Campo obligatorio' : null;
                        },
                        onSaved: (String value) {
                          _address = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.card_travel),
                          labelText: 'Número de DNI o CE',
                        ),
                        validator: (String value) {
                          return (value.isEmpty)  ? 'Campo obligatorio' : null;
                        },
                        onSaved: (String value) {
                          _documentNumber = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Celular',
                        ),
                        validator: (String value) {
                          return (value.isEmpty)  ? 'Campo obligatorio' : null;
                        },
                        onSaved: (String value) {
                          _phone = value;
                        },
                      ),
                    ],

                  )
              ),
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(_formKey.currentState.validate());
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();
          _addDataToFirebase();
        },
        label: Row(
          children: [Text("Siguiente "), Icon(Icons.arrow_forward)],
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
