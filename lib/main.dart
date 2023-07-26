import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'navigator/navigation_state.dart';
import 'navigator/route_information_parser.dart';
import 'navigator/router_delegate.dart';

void main() {
  final routerDelegate = MyRouterDelegate();
  routerDelegate.state = NavigationState.setup();

  GetIt.I.registerSingleton<IRouter>(routerDelegate);
  GetIt.I.registerSingleton<RouterDelegate<NavigationState>>(routerDelegate);

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerDelegate: GetIt.I<RouterDelegate<NavigationState>>(),
      routeInformationParser: _routeInformationParser,
    );
  }
}
