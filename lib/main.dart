import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firebase_firestore/ui/firestore_testing.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FirestoreTest(),
    );
  }
}

class MainPAGE extends StatefulWidget {
  @override
  _MainPAGEState createState() => _MainPAGEState();
}

class _MainPAGEState extends State<MainPAGE> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PICK IMAGE'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _image == null
                ? Text('please select the image')
                : Image.file(_image),
          ),
          RaisedButton(onPressed: () async {
            // String imagePath = _image.path.split('/').last;
            // print(imagePath);
            // StorageTaskSnapshot snapshot = await FirebaseStorage.instance
            //     .ref()
            //     .child(imagePath)
            //     .putFile(_image)
            //     .onComplete;
            // if (snapshot.error == null) {
            //   snapshot.ref.getDownloadURL().then((value) => print(value));
            // }
            QuerySnapshot query = await Firestore.instance
                .collection('users')
                .where('age', isGreaterThan: 10)
                .where('gender', isEqualTo: 'male')
                .orderBy('age')
                .limit(3)
                .getDocuments();
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
      ),
    );
  }
}
