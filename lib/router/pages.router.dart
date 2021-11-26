import 'package:aplicativosi/pages/contacts.screen.dart';
import 'package:aplicativosi/pages/events.screen.dart';
import 'package:aplicativosi/pages/files.screen.dart';
import 'package:aplicativosi/pages/home.screen.dart';
import 'package:aplicativosi/pages/login.screen.dart';
import 'package:aplicativosi/pages/schedules.screen.dart';
import 'package:aplicativosi/pages/splash.screen.dart';
import 'package:flutter/widgets.dart';

const String splashPath = '/splash';
const String homePath = '/home';
const String loginPath = '/login';
const String registerPath = '/register';
const String schedulesPath = '/schedules';
const String eventsPath = '/events';
const String contactsPath = '/contacts';
const String filesPath = '/files';

class PageConfiguration {
  final String key;
  String path;
  Widget page;

  PageConfiguration({
    required this.key,
    required this.path,
    required this.page,
  });
}

PageConfiguration splashPageConfig =
    PageConfiguration(key: 'Splash', path: splashPath, page: Splash());
PageConfiguration loginPageConfig =
    PageConfiguration(key: 'Login', path: loginPath, page: Login());
PageConfiguration homePageConfig =
    PageConfiguration(key: 'Home', path: homePath, page: Home());
PageConfiguration eventsPageConfig =
    PageConfiguration(key: 'Events', path: eventsPath, page: Events());
PageConfiguration contactsPageConfig =
    PageConfiguration(key: 'Contacts', path: contactsPath, page: Contacts());
PageConfiguration schedulesPageConfig =
    PageConfiguration(key: 'Schedules', path: schedulesPath, page: Schedules());
PageConfiguration filesPageConfig =
    PageConfiguration(key: 'files', path: filesPath, page: Files());
