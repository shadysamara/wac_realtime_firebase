import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_project/firebase_firestore/models/firestore_task.dart';
import 'package:firebase_project/firebase_firestore/respositories/firestore_client.dart';
import 'package:flutter/material.dart';

class FirestoreTest extends StatefulWidget {
  @override
  _FirestoreTestState createState() => _FirestoreTestState();
}

class _FirestoreTestState extends State<FirestoreTest> {
  StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult result;
  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
      this.result = result;
      setState(() {});
    });
  }

  Future<bool> checkConnection() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.result.toString(),
          style: TextStyle(fontSize: 50),
          textAlign: TextAlign.center,
        ),
        RaisedButton(onPressed: () {
          checkConnection().then((value) {
            if (value) {
              FireStoreClient.fireStoreClient.insertNewTask(FirestoreTask(
                  date: '25-5-2020',
                  description: 'dummy task',
                  isComplete: true,
                  title: 'this is just for testing'));
            } else {
              print('no network found');
            }
          });
        }),
        RaisedButton(onPressed: () {
          checkConnection().then((value) {
            if (value) {
              FireStoreClient.fireStoreClient.getAllTasks();
            } else {
              print('no network found');
            }
          });
        }),
      ],
    ));
  }
}
