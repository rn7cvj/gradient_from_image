import 'package:flutter/material.dart';
import 'navigation_state.dart';

mixin IRouter {
  void openEditTaskPage(String taskId);

  void openAddTaskPage();

  void openSettingsPage();

  void openInternetErrorPage();

  void popToHomePage();
}

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState>, IRouter {
  NavigationState? state;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Page<dynamic>> pages = [
      const MaterialPage(
        child: HomePage(),
      ),
      if (state?.isAddTask == true)
        const MaterialPage(
          child: AddTaskPage(),
        ),
      if (state?.isEditTask == true)
        MaterialPage(
          child: EditTaskPage(taskId: state!.editTaskId),
        ),
      if (state?.isUnknown == true)
        const MaterialPage(
          child: UnknownPage(),
        ),
      if (state?.isSettings == true)
        const MaterialPage(
          child: SettingsPage(),
        )
    ];

    if (state?.isInternetCheck == true) {
      pages = [
        MaterialPage(
          child: InternetCheckPage(
            onInternetAvalible: popToHomePage,
            onInternetUnavalible: openInternetErrorPage,
          ),
        ),
      ];
    }

    if (state?.isInternetError == true) {
      pages = [
        const MaterialPage(
          child: NoInternetPage(),
        ),
      ];
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }

  @override
  void openAddTaskPage() {
    state = NavigationState.createTask();
    notifyListeners();
  }

  @override
  void openEditTaskPage(String taskId) {
    state = NavigationState.editTask(taskId);
    notifyListeners();
  }

  @override
  void openSettingsPage() {
    state = NavigationState.settings();
    notifyListeners();
  }

  @override
  void popToHomePage() {
    state = NavigationState.root();
    notifyListeners();
  }

  @override
  void openInternetErrorPage() {
    state = NavigationState.internetError();
    notifyListeners();
  }
}
