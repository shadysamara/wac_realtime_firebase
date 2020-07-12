import 'package:flutter/material.dart';
import 'package:firebase_project/fireAuth_helper.dart';

class MyFirstPage extends StatelessWidget {
  Future<bool> checkUser() async {
    bool x = await FireAuthHelper.fireAuthHelper.checkUserLogin();
    return x;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FireAuthHelper.fireAuthHelper.signOutFromDevice();
          },
        ),
      ),
      body: Center(
          child: FutureBuilder<bool>(
        future: checkUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data ? 'yes' : 'no');
          } else {
            return Text('no data found');
          }
        },
      )),
    );
  }
}
