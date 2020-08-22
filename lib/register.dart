import 'package:flutter/material.dart';
import 'package:upuc/typecare.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formato de registro'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            children: [
              Text('Completa todos los campos que se detallan a continuación:'),
              Padding(padding: EdgeInsets.all(20)),
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TypeCareScreen()),
          );
        },
        label: Text('Siguiente'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}