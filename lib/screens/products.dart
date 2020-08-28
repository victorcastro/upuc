import 'package:flutter/material.dart';
import 'package:upuc/thanks.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona uno'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) => Center(
          child: FlatButton(
            padding: EdgeInsets.all(15),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThanksScreen()),
              );
            },
            child: GridTile(
              footer: Center(child: Text(products[index].name)),
              child: Image.asset('assets/images/'+products[index].image, width: 50, height: 50,),
            ),
          ),
        )),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  
  const Product({this.name, this.image});
}

List<Product> products = const <Product> [
  const Product(name: "Productos para bebes", image: "prod-bebes.jpg"),
  const Product(name: "Protección Covid-19", image: "prod-covid.jpg"),
  const Product(name: "Higiene personal", image: "prod-higiene.jpg"),
  const Product(name: "Medicinas", image: "prod-medicinas.jpg"),
  const Product(name: "Ropa", image: "prod-ropa.jpg"),
  const Product(name: "Víveres", image: "prod-viveres.jpg"),
];