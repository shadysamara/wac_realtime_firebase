import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/Home_Page.dart';
import 'package:firebase_project/firebase_database/firebaseDBHelper.dart';
import 'package:firebase_project/firebase_database/firebase_task.dart';
import 'package:firebase_project/testFirebaseRealtime.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/fireAuth_helper.dart';
import 'package:firebase_project/my_app_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: FirebaseRealtimeDBTest(),
    );
  }
}

class FirebaseRealtimeDBTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('test real time'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(onPressed: () {
            FBDbHelper.fbDbHelper.insertNewFirebaseTask(FirebaseTask(
                title: 'new task to test the stream',
                description: 'my task description'));
          }),
          RaisedButton(onPressed: () {
            FBDbHelper.fbDbHelper.insertNewFirebaseNamedTask(
                FirebaseTask(title: 'task', description: 'desc'));
          }),
          RaisedButton(onPressed: () {
            FBDbHelper.fbDbHelper.childIsChanged();
          }),
          StreamBuilder<Event>(
            stream: FBDbHelper.fbDbHelper.initFBDB().onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var x = snapshot.data.snapshot.value;
                print(x);
                return Text('New data');
              } else {
                return Text('No data');
              }
            },
          )

          // StreamBuilder<Event>(
          //     stream: FBDbHelper.fbDbHelper.initFBDB().onChildAdded,
          //     builder: (BuildContext context, snapshot) {
          //       if (snapshot.hasData) {
          //         print('new order added');
          //         // Map<String, dynamic> map =
          //         //     Map<String, dynamic>.from(snapshot.data.snapshot.value);
          //         print(snapshot.data.snapshot.value);
          //         return Text('hello');
          //       } else if (snapshot.hasError) {
          //         return Text('no data');
          //       }
          //     })
        ],
      ),
    );
  }
}

/// check if the user logged in or not
class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<bool>(
      future: FireAuthHelper.fireAuthHelper.checkUserLogin(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool isLogged = snapshot.data;
          if (isLogged) {
            return MyFirstPage();
          } else {
            return HomePage();
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// class BrokerPage extends StatefulWidget {
//   @override
//   _BrokerPageState createState() => _BrokerPageState();
// }

// class _BrokerPageState extends State<BrokerPage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return FutureBuilder<bool>(
//       future: FireAuthHelper.fireAuthHelper.getloginUser(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           bool results = snapshot.data;
//           print(results);
//           if (results) {
//             return MyFirstPage();
//           } else {
//             return HomePage();
//           }
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
