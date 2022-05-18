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
abstract class AppRoutes {
  static const init = '/404';
}
