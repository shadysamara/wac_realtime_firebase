import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:firebase_project/fireAuth_helper.dart';

class HomePage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  String password;
  setEmail(value) {
    this.email = value;
  }

  setPassword(value) {
    this.password = value;
  }

  loginByEmailAndPassword() {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      FireAuthHelper.fireAuthHelper.loginByEmailAndPassword(email, password);
    }
  }

  registeringByEmailAndPassword() {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      FireAuthHelper.fireAuthHelper.registerByEmailAndPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => this.setEmail(newValue),
                  validator: (value) {
                    if (!isEmail(value)) {
                      return 'please enter a correct email address';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  onSaved: (newValue) => this.setPassword(newValue),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you cant enter empty password';
                    } else if (value.length <= 6) {
                      return 'password length must be larger than 6';
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () => loginByEmailAndPassword(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Login'),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => registeringByEmailAndPassword(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Register'),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
