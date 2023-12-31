// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bottom_nav_bar_go_router/router.dart';

class SectionScreen extends StatelessWidget {
  final String subName;
  const SectionScreen({
    Key? key,
    required this.subName,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    print('------------------------ Root of section $label');
    return Scaffold(
      appBar: AppBar(
        title: Text('Root of section $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Screen $label',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(subName);
              },
              child: Text('Go To $subName'),
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
