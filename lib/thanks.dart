import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/panda.png', width: 170,),
              Padding(padding: EdgeInsets.all(20)),
              Text(
                'Gracias, estaremos en cominicacion con usted',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}