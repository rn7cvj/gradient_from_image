import 'package:flutter/material.dart';
import 'package:gradient_from_image/modal/image_gradinet.dart';
import 'package:gradient_from_image/pages/gradient_page/gradient_page.dart';
import 'package:gradient_from_image/pages/setup_page/setup_page.dart';
import 'navigation_state.dart';

abstract class IRouter {
  void openGradientPage(ImageGradient gradient);

  void popToSetupPage();
}

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState>
    implements IRouter {
  NavigationState? state;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Page<dynamic>> pages = [
      if (state?.isSetup == true)
        const MaterialPage(
          child: SetupPage(),
        ),
      if (state?.isGradient == true)
        MaterialPage(
          child: GradientPage(gradient: state!.imageGradient!),
        ),
    ];

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state = NavigationState.setup();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  void openGradientPage(ImageGradient gradient) {
    state = NavigationState.imageGradient(gradient);
    notifyListeners();
  }

  @override
  void popToSetupPage() {
    state = NavigationState.setup();
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }
}
