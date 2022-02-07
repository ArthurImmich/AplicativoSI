import 'package:aplicativosi/router/delegate.router.dart';
import 'package:aplicativosi/router/pages.router.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "1007354186909-i4tbpd6678kom3qnd0vcni3mebr4gs60.apps.googleusercontent.com");
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Logue com o google",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              startSignIn();
            },
            child: Text('Tap to sign in'),
          ),
        ],
      ),
    );
  }

  void startSignIn() async {
    await googleSignIn.signOut();
    GoogleSignInAccount? user = await googleSignIn.signIn();
    if (user == null) {
      print('Sign In Failed ');
    } else {
      (Router.of(context).routerDelegate as Delegate)
          .setNewRoutePath(homePageConfig);
    }
  }
}
