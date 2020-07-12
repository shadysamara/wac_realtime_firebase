import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/tasks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTestRealtime extends StatelessWidget {
  DatabaseReference firebaseDatabase;
  DatabaseReference initDb() {
    firebaseDatabase = FirebaseDatabase.instance.reference();
    return firebaseDatabase;
  }

  insertNewData(Task task) {
    firebaseDatabase = initDb();
    firebaseDatabase.set(task.toJson());
  }

  insertInSpecificChild(String child, Task task) {
    firebaseDatabase = initDb();
    firebaseDatabase.child(child).set(task.toJson());
  }

  getAllData() async {
    firebaseDatabase = initDb();
    DataSnapshot dataSnapshot = await firebaseDatabase.once();
    dynamic valu = dataSnapshot.value;
    print(valu);
  }

  getSpecificData(String path) async {
    firebaseDatabase = initDb();
    DataSnapshot dataSnapshot = await firebaseDatabase.child(path).once();
    dynamic valu = dataSnapshot.value;
    print(valu);
  }

  updateData(String path, Task task) async {
    firebaseDatabase = initDb();
    await firebaseDatabase.child(path).update(task.toJson());
  }

  deleteData(String path) async {
    firebaseDatabase = initDb();
    await firebaseDatabase.child(path).remove();
  }

  addUsigHttp(Task task) async {
    try {
      http.Client client = http.Client();
      String url = 'https://wacfbproject.firebaseio.com/';
      http.Response x = await client.post(url, body: task.toJson());
      print(x.body);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(onPressed: () {
            insertNewData(Task(
                title: 'testing2',
                description: 'testDesc2',
                isComplete: false));
          }),
          RaisedButton(onPressed: () {
            insertInSpecificChild(
                'child2',
                Task(
                    title: 'testing2',
                    description: 'testDesc2',
                    isComplete: false));
          }),
          RaisedButton(onPressed: () {
            getAllData();
          }),
          RaisedButton(onPressed: () {
            addUsigHttp(
                Task(title: 'ffff', description: 'gggg', isComplete: true));
          })
        ],
      ),
    );
  }
}
