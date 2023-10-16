import 'package:go_router/go_router.dart';

extension GoRouteExtension on GoRoute {
  GoRoute withSubRoutes({List<RouteBase> subRoutes = const <RouteBase>[]}) {
    return GoRoute(
      name: name,
      path: path,
      builder: builder,
      routes: subRoutes,
    );
  }
}
