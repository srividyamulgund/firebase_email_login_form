import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseemailloginform/src/app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: RaisedButton(
          child: Text("Sign Out"),
          onPressed: () {
            _signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => App()),
                (Route<dynamic> route) => false);
          },
        )),
      ),
    );
  }
}
