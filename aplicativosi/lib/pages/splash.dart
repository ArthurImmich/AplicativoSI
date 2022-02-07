import 'package:aplicativosi/router/delegate.router.dart';
import 'package:aplicativosi/router/pages.router.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "1007354186909-i4tbpd6678kom3qnd0vcni3mebr4gs60.apps.googleusercontent.com");

  @override
  void initState() {
    checkSignInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(fontSize: 30),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  void checkSignInStatus() async {
    bool isSignedIn = await googleSignIn.isSignedIn();
    if (isSignedIn) {
      (Router.of(context).routerDelegate as Delegate)
          .setNewRoutePath(homePageConfig);
    } else {
      (Router.of(context).routerDelegate as Delegate)
          .setNewRoutePath(loginPageConfig);
    }
  }
}
