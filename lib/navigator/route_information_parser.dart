import 'package:flutter/material.dart';

import 'navigation_state.dart';

/// URI <> NavigationState
class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(RouteInformation routeInformation) async {
    final location = routeInformation.location;

    return NavigationState.setup();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    return const RouteInformation(location: '/');
  }
}
