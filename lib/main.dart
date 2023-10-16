import 'package:bottom_nav_bar_go_router/go_route_extension.dart';
import 'package:bottom_nav_bar_go_router/loading_screen.dart';
import 'package:bottom_nav_bar_go_router/login_screen.dart';
import 'package:bottom_nav_bar_go_router/router.dart';
import 'package:bottom_nav_bar_go_router/screen_a.dart';
import 'package:bottom_nav_bar_go_router/screen_b.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'settings_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      AppRoutes.root.withSubRoutes(
        subRoutes: [
          AppRoutes.login,
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
              return ScaffoldBottomNavigationBar(
                navigationShell: navigationShell,
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                routes: <RouteBase>[
                  AppRoutes.screenA.withSubRoutes(subRoutes: [AppRoutes.settingScreen]),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  AppRoutes.screenB,
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static final root = GoRoute(
    path: '/',
    name: AppRouter.loading,
    builder: (BuildContext context, GoRouterState state) {
      return const LoadingScreen();
    },
  );

  static final login = GoRoute(
    path: AppRouter.login,
    name: AppRouter.login,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  );

  static final screenA = GoRoute(
    path: AppRouter.screenA,
    name: AppRouter.screenA,
    builder: (BuildContext context, GoRouterState state) {
      return const ScreenA();
    },
  );
  static final settingScreen = GoRoute(
    path: AppRouter.settingScreen,
    name: AppRouter.settingScreen,
    builder: (BuildContext context, GoRouterState state) {
      return const SettingsScreen(label: 'setting screen');
    },
  );

  static final screenB = GoRoute(
    path: AppRouter.screenB,
    name: AppRouter.screenB,
    builder: (BuildContext context, GoRouterState state) {
      return const ScreenB();
    },
  );
}

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go_router Complex Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      routerConfig: AppRoutes.router,
    );
  }
}

class ScaffoldBottomNavigationBar extends StatelessWidget {
  const ScaffoldBottomNavigationBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldBottomNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section_A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section_B'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int tappedIndex) {
          navigationShell.goBranch(tappedIndex);
        },
      ),
    );
  }
}
