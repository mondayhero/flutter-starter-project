import 'package:flutter/material.dart';
import 'package:mondayhero_starter_project/route/app_routes.dart';

/// Set values as below where you configured MaterialApp.
/// ```dart
/// MaterialApp(
///   // ...
///   initialRoute: AppRoutes.init,
///   onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
///   localizationsDelegates: context.localizationDelegates,
///   locale: context.locale,
///   supportedLocales: context.supportedLocales,
///   // ...
/// )
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('404 Page ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
