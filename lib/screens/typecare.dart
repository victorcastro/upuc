import 'package:flutter/material.dart';
import 'package:upuc/components/customShapeClipper.dart';
import 'package:upuc/screens/accounts.dart';
import 'package:upuc/screens/products.dart';

class TypeCareScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necesito apoyo'),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF0F0F0),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(height: 130, color: Colors.pink),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              child: Column(
                children: [
                  Text('Seleccione el tipo de apoyo que necesita:', style: TextStyle(color: Colors.white),),
                  Padding(padding: EdgeInsets.only(bottom: 80)),
                  Center(
                    child: Column(
                      children: [
                        FlatButton(
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AccountScreen()),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductsScreen()),
                            );
                          },
                          child: Image.asset('assets/images/comida.png', width: 150,),
                        ),
                        Text('Apoyo con Víveres'),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}