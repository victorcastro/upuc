import 'package:flutter/material.dart';
import 'package:upuc/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPUC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'UPUC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Innova Schools - Pueblo Libre'),
              accountEmail: Text('Grado 8C'),
              currentAccountPicture: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/panda.jpg'),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/innova-pueblo-libre.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('INTEGRANTES'),
            ),
            ListTile(
              title: Text('Daira Castro'),
              enabled: true,
              onTap: () {},
            ),
            ListTile(
              title: Text('Arantxa Villanes'),
              enabled: true,
              onTap: () {},
            ),
            ListTile(
              title: Text('Celina Ruiz'),
              enabled: true,
              onTap: () {},
            ),
            ListTile(
              title: Text('Alejandro Ramos'),
              enabled: true,
              onTap: () {},
            ),
            ListTile(
              title: Text('Alejandra Jimenez'),
              enabled: true,
              onTap: () {},
            ),
            ListTile(
              title: Text('Cathy Salmón'),
              enabled: true,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20)),
              Image.asset(
                'assets/images/upuc.png',
                width: 170,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 30),
                child: Text(
                  'Esta app está hecha para poder recaudar fondos para las personas en situación de necesidad de manera que se puedad apoyar con dinero o alimentos toda ayuda sera bien recibida. si deseas apoyar dale en siguiente.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        label: Text('Ingresar'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
