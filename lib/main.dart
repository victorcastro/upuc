import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upuc/components/customShapeClipper.dart';
import 'package:upuc/register.dart';
import 'package:upuc/screens/donations.dart';
import 'package:yaml/yaml.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  _createAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Contraseña'),
        content: TextField(
          controller: customController,
        ),
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Text('Confirmar'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DonationsScreen()),
              );
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        actions: [
          FutureBuilder(
              future: rootBundle.loadString("pubspec.yaml"),
              builder: (context, snapshot) {
                String version = "Unknown";
                if (snapshot.hasData) {
                  var yaml = loadYaml(snapshot.data);
                  version = yaml["version"];
                }

                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Ver ${version.split("+")[0]}'
                    ),
                  ),
                );
              }),
        ],
      ),
      backgroundColor: Color(0xFFF0F0F0),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Innova Schools - Pueblo Libre', style: TextStyle(fontSize: 18),),
              accountEmail: Text('Grado 8C', style: TextStyle(),),
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
            Divider(),
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
            Divider(),
            ListTile(
              title: Text('Donaciones', style: TextStyle(color: Colors.pink),),
              leading: Icon(Icons.lock, color: Colors.pink,),
              onTap: () {
                _createAlertDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(height: 280, color: Colors.pink),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Unidos Por Una Causa', style: TextStyle(fontSize: 22, color: Colors.white),),
                Padding(padding: EdgeInsets.all(10)),
                Text('Esta app está hecha para poder recaudar fondos para las personas en situación de necesidad de manera que se puedad apoyar con dinero o alimentos toda ayuda sera bien recibida. si deseas apoyar dale en siguiente.', style: TextStyle(color: Colors.white, height: 1.7), textAlign: TextAlign.center),
                SizedBox(height: 120),
                Image.asset('assets/images/panda.png', width: 170,),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        label: Row(
          children: [Text("Enviar apoyo "), Icon(Icons.local_hospital)],
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
