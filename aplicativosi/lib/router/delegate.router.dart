import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages.router.dart';

class Delegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  //Pages list
  final List<Page> _pages = [];

  //Back button dispatcher
  late final BackButtonDispatcher backButtonDispatcher;

  //Allows only one instance of this RouterDelegate and it
  //can be acessed from anywhere
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  Delegate() : navigatorKey = GlobalKey<NavigatorState>();

  //Gets the current list of pages
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  //Gets the arguments of the last page in the
  //list as PageConfiguration (created type)
  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  //Returns true when the page did pop and removes it
  //from the _pages list and notifies its listeners.
  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();
    return true;
  }

  //Builds the navigator using the global key and onPopPage methods
  //Pass the _pages list as an argument
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  //Creates the necessary Navigator MaterialPage's
  //whith the pages key, configuration and path as name
  //and a child widget corresponding the page.
  MaterialPage _newPage(PageConfiguration pageConfig) {
    return MaterialPage(
        child: pageConfig.page,
        key: Key(pageConfig.key) as LocalKey,
        name: pageConfig.path,
        arguments: pageConfig);
  }

  //Replaces last page by a new one
  void replace(PageConfiguration newPage) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    _pages.add(_newPage(newPage));
    notifyListeners();
  }

  void push(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).page != pageConfig.page;
    if (shouldAddPage) {
      _pages.add(_newPage(pageConfig));
    }
    notifyListeners();
  }

  //Clears _page list and adds a new page
  //Get the information from parseRouteInformation
  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    _pages.clear();
    push(configuration);
  }
}
