// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bottom_nav_bar_go_router/app/cubit/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Screen A',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRouter.screenB);
              },
              child: const Text('Go To screenB'),
            ),
          ],
        ),
      ),
    );
  }
}
