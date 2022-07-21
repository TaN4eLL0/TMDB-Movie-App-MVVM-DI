import 'package:flutter/material.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';
import 'package:movieapp/widgets/my_app.dart';

abstract class ScreenFactory {
  Widget makeLoader();

  Widget makeAuth();

  Widget makeMainScreen();

  Widget movieDetails(int movieId);

  Widget movieTrailer(String youtubeKey);

  Widget makeMovieHome();

  // Widget makeMoviePopular();

  // Widget makeMovieRated();

  Widget makeMovieFavorite();

  Widget makeMovieList();

  Widget makeActorDetails(int personId);
}

class MainNavigation implements MyAppNavigation {
  final ScreenFactory screenFactory;

  const MainNavigation(this.screenFactory);

  @override
  Map<String, Widget Function(BuildContext)> get routes => {
        MainNavigationRouteNames.loaderWidget: (_) =>
            screenFactory.makeLoader(),
        MainNavigationRouteNames.auth: (_) => screenFactory.makeAuth(),
        MainNavigationRouteNames.mainScreen: (_) =>
            screenFactory.makeMainScreen(),
      };

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => screenFactory.movieDetails(movieId),
        );
      case MainNavigationRouteNames.movieTrailerWidget:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => screenFactory.movieTrailer(youtubeKey),
        );
      case MainNavigationRouteNames.actorDetails:
        final arguments = settings.arguments;
        final personId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeActorDetails(personId),
        );
      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
