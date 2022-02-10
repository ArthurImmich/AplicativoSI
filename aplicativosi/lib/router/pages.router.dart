import 'package:aplicativosi/pages/contacts.screen.dart';
import 'package:aplicativosi/pages/events.screen.dart';
import 'package:aplicativosi/pages/files.screen.dart';
import 'package:aplicativosi/pages/home.screen.dart';
import 'package:aplicativosi/pages/login.screen.dart';
import 'package:aplicativosi/pages/notifications.screen.dart';
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
const String notificationsPath = '/notifications';

class PageConfiguration {
  final String key;
  String path;
  bool authentication;
  Widget page;

  PageConfiguration({
    required this.key,
    required this.path,
    required this.page,
    this.authentication = false,
  });
}

PageConfiguration splashPageConfig = PageConfiguration(
  key: 'Splash',
  path: splashPath,
  page: Splash(),
);
PageConfiguration loginPageConfig = PageConfiguration(
  key: 'Login',
  path: loginPath,
  page: LoginScreen(),
);
PageConfiguration homePageConfig = PageConfiguration(
  key: 'Home',
  path: homePath,
  page: Home(),
  // authentication: true,
);
PageConfiguration eventsPageConfig = PageConfiguration(
  key: 'Events',
  path: eventsPath,
  page: Events(),
  // authentication: true,
);
PageConfiguration contactsPageConfig = PageConfiguration(
  key: 'Contacts',
  path: contactsPath,
  page: Contacts(),
  // authentication: true,
);
PageConfiguration schedulesPageConfig = PageConfiguration(
  key: 'Schedules',
  path: schedulesPath,
  page: Schedules(),
  // authentication: true,
);
PageConfiguration filesPageConfig = PageConfiguration(
  key: 'Files',
  path: filesPath,
  page: SIFiles(),
  // authentication: true,
);
PageConfiguration notificationsPageConfig = PageConfiguration(
  key: 'Notifications',
  path: notificationsPath,
  page: Notifications(),
  // authentication: true,
);
