import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseemailloginform/src/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  Future<void> register() async {
    auth.createUserWithEmailAndPassword(email: _email, password: _password);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Future<void> signin() async {
    auth.signInWithEmailAndPassword(email: _email, password: _password);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email Id',
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Sign In'),
                    onPressed: () {
                      signin();
                    }),
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Sign Up'),
                    onPressed: () {
                      register();
                    })
              ],
            )
          ],
        ));
  }
}
