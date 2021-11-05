import 'package:flutter/material.dart';
import 'delegate.router.dart';

class BackDispatcher extends RootBackButtonDispatcher {
  final Delegate _routerDelegate;

  BackDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
