import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRouter.screenA);
              },
              child: const Text('Login and Enter ScreenA'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRouter.screenB);
              },
              child: const Text('Login and Enter ScreenB'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRouter.screenASub);
              },
              child: const Text('Login and Enter screenASub'),
            ),
          ],
        ),
      ),
    );
  }
}
