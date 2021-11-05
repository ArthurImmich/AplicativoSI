import 'package:flutter/material.dart';

import 'router/backButton.router.dart';
import 'router/delegate.router.dart';
import 'router/parser.router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistemas de Informação - UFSM FW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Parser _parser;
  late final BackButtonDispatcher _backButtonDispatcher;
  late final Delegate _delegate;

  @override
  void initState() {
    _delegate = Delegate();
    _parser = Parser();
    _backButtonDispatcher = BackDispatcher(_delegate);
    if (!mounted) return;
    setState(() => _delegate.push(splashPageConfig));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _parser, routerDelegate: _delegate);
  }
}
