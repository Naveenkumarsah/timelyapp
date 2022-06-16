
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/firbasechat/Authenticate/LoginScree.dart';
import 'package:firebase_signin/firbasechat/Screens/ChathomeScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
    return ChatpageHomeScreen();
    }
    else {
      return LoginScreen();
    }
  }
}
