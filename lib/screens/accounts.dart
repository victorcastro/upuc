import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:upuc/main.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Cuentas Bancarias'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Center(child: Text('Banco de Credito BCP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            Padding(padding: EdgeInsets.only(bottom: 20),),
            Center(child: Text('Corriente Soles: 10-012-91561643-012', style: TextStyle(fontSize: 18),)),
            Padding(padding: EdgeInsets.only(bottom: 10),),
            Center(child: Text('Interbancario: 100-0120-91561643005-012', style: TextStyle(fontSize: 18),)),
            Padding(padding: EdgeInsets.all(40)),
            Image.asset('assets/images/panda.png', width: 170,),
            Padding(padding: EdgeInsets.all(20)),
            Text(
              'Gracias, envíanos una copia del depósito a: depositos@upuc.org.pe',
              style: TextStyle(fontSize: 20, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
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
