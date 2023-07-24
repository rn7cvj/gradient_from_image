import 'package:flutter/material.dart';
import 'package:todo_list/navigation/routes_name.dart';

import 'navigation_state.dart';

/// URI <> NavigationState
class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(RouteInformation routeInformation) async {
    final location = routeInformation.location;
    if (location == null) {
      return NavigationState.unknown();
    }

    final uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return NavigationState.internetCheck();
    }

    return NavigationState.root();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration.isAddTask) {
      return const RouteInformation(location: '/${RoutesName.createTask}');
    }

    if (configuration.isEditTask) {
      return RouteInformation(location: '/${RoutesName.editTask}/${configuration.editTaskId}');
    }

    return const RouteInformation(location: '/');
  }
}
