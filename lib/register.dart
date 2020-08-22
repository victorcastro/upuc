import 'package:flutter/material.dart';

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
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  labelText: 'Dirección',
                )
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.card_travel),
                  labelText: 'DNI o CE',
                )
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Celular',
                )
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}