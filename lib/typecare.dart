import 'package:flutter/material.dart';
import 'package:upuc/thanks.dart';

class TypeCareScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necesito apoyo'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            children: [
              Text('Seleccione el tipo de apoyo que necesita:'),
              Padding(padding: EdgeInsets.all(20)),
              Center(
                child: Column(
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThanksScreen()),
                        );
                      },
                      child: Image.asset('assets/images/efectivo.png', width: 150,),
                    ),
                    Text('Apoyo económico'),
                  ],
                )
              ),
              Padding(padding: EdgeInsets.all(47)),
              Center(
                child: Column(
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(15),
                      onPressed: () {},
                      child: Image.asset('assets/images/comida.png', width: 150,),
                    ),
                    Text('Apoyo alimenticio'),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}