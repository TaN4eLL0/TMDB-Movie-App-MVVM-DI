import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';

abstract class MyAppNavigation {
  Map<String, Widget Function(BuildContext)> get routes;
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final MyAppNavigation navigation;
  const MyApp({Key? key, required this.navigation,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
        ),
      ),
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'UA'),
      ],
      routes: navigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
