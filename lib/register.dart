import 'package:flutter/material.dart';
import 'package:upuc/components/customShapeClipper.dart';
import 'package:upuc/screens/typecare.dart';

class RegisterScreen extends StatelessWidget {

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
            child: Column(
              children: [
                Text('Déjanos tus datos y nos podremos en contacto contigo para brindarte la ayuda que necesitas', style: TextStyle(color: Colors.white, height: 1.7), textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.all(50)),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Nombres completos',
                        )
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_city),
                          labelText: 'Dirección',
                        )
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.card_travel),
                          labelText: 'DNI o CE',
                        )
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Celular',
                        )
                      ),
                    
                    ],
                  ),
                ),
              ]
            )
          ),
 
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TypeCareScreen()),
          );
        },
        label: Row(
          children: [Text("Siguiente "), Icon(Icons.arrow_forward)],
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }
}