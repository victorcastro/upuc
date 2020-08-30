import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CollectionReference donaciones = FirebaseFirestore.instance.collection('donaciones');

    return Scaffold(
      appBar: AppBar(
        title: Text('Donaciones realizadas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: donaciones.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
            return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
            }

            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {

              return new ListTile(
                title: new Text(document.data()['fullname'] + ' (+51 ' + document.data()['phone'] + ')'),
                subtitle: new Text(document.data()['address']),
              );
              }).toList(),
            );
          }
        ),
      ),
    );
  }
}