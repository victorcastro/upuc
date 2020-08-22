import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:upuc/main.dart';

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
                'Gracias, estaremos en cominicación con usted lo antes posible.',
                style: TextStyle(fontSize: 25, height: 1.4),
                textAlign: TextAlign.center,
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
            // Navigator.of(context).pushNamed("thanks");
          });
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.pink,
      ),
    );
  }
}