import 'package:flutter/material.dart';
import 'pages.router.dart';

class Parser extends RouteInformationParser<PageConfiguration> {
  //Converts the url into the navigation state.
  //Called when the url is updated.
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    // final uri = Uri.parse(routeInformation.location!);
    //if there is no URI, returns splash
    // if (uri.pathSegments.isEmpty) {
    return splashPageConfig;
    // }
    // final path = "/" + uri.pathSegments[0];

    // switch (path) {
    //   case splashPath:
    //     return splashPageConfig;
    //   case loginPath:
    //     return loginPageConfig;
    //   case registrationPath:
    //     return registrationPageConfig;
    //   case homePath:
    //     return homePageConfig;
    //   case schedulesPath:
    //     return schedulesPageConfig;
    //   case eventsPath:
    //     return eventsPageConfig;
    //   case filesPath:
    //     return filesPageConfig;
    //   case contactsPath:
    //     return contactsPageConfig;
    //   default:
    //     return splashPageConfig;
    // }
  }

  //Takes a navigation state and then convert it into a url.
  //Called after routerDelegate.currentConfiguration
  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(location: configuration.path);
  }
}
