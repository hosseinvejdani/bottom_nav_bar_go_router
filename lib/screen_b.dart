// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bottom_nav_bar_go_router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Screen B',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRouter.login);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
