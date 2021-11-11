import 'dart:async';

import 'package:aplicativosi/router/delegate.router.dart';
import 'package:aplicativosi/router/pages.router.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo/logo.png',
          height: 200,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 2000), () {
        // if (loggedIn) {
        // (Router.of(context).routerDelegate as Delegate)
        //     .replace(homePageConfig);
        // } else {
        (Router.of(context).routerDelegate as Delegate)
            .replace(loginPageConfig);
        // }
      });
    }
  }
}
