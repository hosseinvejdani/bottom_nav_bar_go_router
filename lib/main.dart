import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app/cubit/currency_cubit.dart';
import 'app/repositories/cubit_repository.dart';
import 'app/router.dart';
import 'app/screen_a.dart';
import 'app/screen_b.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CubitRepo(),
      child: MaterialApp.router(
        theme: ThemeData(primarySwatch: Colors.orange),
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              name: AppRouter.screenA,
              builder: (BuildContext context, GoRouterState state) {
                RepositoryProvider.of<CubitRepo>(context).putCubit(UserCubit());
                return BlocProvider(
                  create: (context) => RepositoryProvider.of<CubitRepo>(context).findCubit<UserCubit>(),
                  child: const ScreenA(),
                );
              },
              routes: [
                GoRoute(
                  path: AppRouter.screenB,
                  name: AppRouter.screenB,
                  builder: (BuildContext context, GoRouterState state) {
                    return BlocProvider.value(
                      value: RepositoryProvider.of<CubitRepo>(context).findCubit<UserCubit>(),
                      child: const ScreenB(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
