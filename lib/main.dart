import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseemailloginform/src/app.dart';
import 'package:flutter/material.dart';
//import 'package:form_field_validator/form_field_validator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
