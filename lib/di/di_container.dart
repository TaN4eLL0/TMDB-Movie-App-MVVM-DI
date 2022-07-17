import 'package:flutter/material.dart';
import 'package:movieapp/Library/flutter_secure_storage/secure_storage.dart';
import 'package:movieapp/Library/http_client/app_http_client.dart';
import 'package:movieapp/domain/api_client/AccountApiClient.dart';
import 'package:movieapp/domain/api_client/auth_api_client.dart';
import 'package:movieapp/domain/api_client/movie_api_client.dart';
import 'package:movieapp/domain/api_client/network_client.dart';
import 'package:movieapp/domain/data_providers/session_data_provider.dart';
import 'package:movieapp/domain/services/auth_service.dart';
import 'package:movieapp/domain/services/movie_service.dart';
import 'package:movieapp/main.dart';
import 'package:movieapp/navigation/main_navigation.dart';
import 'package:movieapp/navigation/main_navigation_actions.dart';
import 'package:movieapp/widgets/auth/auth_model.dart';
import 'package:movieapp/widgets/auth/auth_widget.dart';
import 'package:movieapp/widgets/loader_widget/loader_view_model.dart';
import 'package:movieapp/widgets/loader_widget/loader_widget.dart';
import 'package:movieapp/widgets/main_screen/main_screen_view_model.dart';
import 'package:movieapp/widgets/main_screen/main_screen_widget.dart';
import 'package:movieapp/widgets/movie_details/movie_details_model.dart';
import 'package:movieapp/widgets/movie_details/movie_details_widget.dart';
import 'package:movieapp/widgets/movie_favorites/movie_favorite_model.dart';
import 'package:movieapp/widgets/movie_favorites/movie_favorite_widget.dart';
import 'package:movieapp/widgets/movie_home/movie_home_actor_view_model.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_view_model.dart';
import 'package:movieapp/widgets/movie_home/movie_home_widget.dart';
import 'package:movieapp/widgets/movie_list/movie_list_model.dart';
import 'package:movieapp/widgets/movie_list/movie_list_widget.dart';
import 'package:movieapp/widgets/movie_trailer/movie_trailer_widgets.dart';
import 'package:movieapp/widgets/my_app.dart';
import 'package:provider/provider.dart';

AppFactory makeAppFactory() => _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = _DIContainer();

  _AppFactoryDefault();

  @override
  Widget makeApp() => MyApp(
        navigation: _diContainer._makeMyAppNavigation(),
      );
}

class _DIContainer {
  final _mainNavigationActions = const MainNavigationActions();
  final SecureStorage _secureStorage = const SecureStorageDefault();
  final AppHttpClient _httpClient = AppHttpClientDefault();

  _DIContainer();

  ScreenFactory _makeScreenFactory() => ScreenFactoryDefault(this);

  MyAppNavigation _makeMyAppNavigation() =>
      MainNavigation(_makeScreenFactory());

  SessionDataProvider _makeSessionDataProvider() =>
      SessionDataProviderDefault(_secureStorage);

  NetworkClient _makeNetworkClient() => NetworkClientDefault(_httpClient);

  AuthApiClient _makeAuthApiClient() =>
      AuthApiClientDefault(_makeNetworkClient());

  AccountApiClient _makeAccountApiClient() =>
      AccountApiClientDefault(_makeNetworkClient());

  AuthService _makeAuthService() => AuthService(
        sessionDataProvider: _makeSessionDataProvider(),
        accountApiClient: _makeAccountApiClient(),
        authApiClient: _makeAuthApiClient(),
      );

  MovieApiClient _makeMovieApiClient() =>
      MovieApiClientDefault(_makeNetworkClient());

  MovieService _makeMovieService() => MovieService(
        movieApiClient: _makeMovieApiClient(),
        sessionDataProvider: _makeSessionDataProvider(),
        accountApiClient: _makeAccountApiClient(),
      );

  AuthViewModel _makeAuthViewModel() => AuthViewModel(
        loginProvider: _makeAuthService(),
        mainNavigationActions: _mainNavigationActions,
      );

  LoaderViewModel _makeLoaderViewModel(BuildContext context) => LoaderViewModel(
        context: context,
        authStatusProvider: _makeAuthService(),
      );

  MovieDetailsModel _makeMovieDetailsModel(int movieId) => MovieDetailsModel(
        movieId,
        movieProvider: _makeMovieService(),
        logoutProvider: _makeAuthService(),
        navigationActions: _mainNavigationActions,
      );

  MovieListViewModel _makeMovieListViewModel() => MovieListViewModel(
        movieProvider: _makeMovieService(),
      );

  MovieFavoriteViewModel _makeMovieFavoriteViewModel() => MovieFavoriteViewModel(
      loadFavoriteMovie: _makeMovieService(),
  );

  MovieHomeUpcomingViewModel _makeMovieHomeUpcomingViewModel() => MovieHomeUpcomingViewModel(
    loadService: _makeMovieService(),
  );

  MovieHomeActorViewModel _makeMovieHomeActorViewModel() => MovieHomeActorViewModel(
    loadActor: _makeMovieService(),
  );
}

class ScreenFactoryDefault implements ScreenFactory {
  final _DIContainer _diContainer;

  const ScreenFactoryDefault(this._diContainer);

  @override
  Widget makeLoader() {
    return Provider(
      create: (context) => _diContainer._makeLoaderViewModel(context),
      child: const LoaderWidget(),
      lazy: false,
    );
  }

  @override
  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => _diContainer._makeAuthViewModel(),
      child: const AuthWidget(),
    );
  }

  @override
  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MainScreenViewModel(
        _diContainer._makeSessionDataProvider(),
      ),
      child: MainScreenWidget(screenFactory: this),
    );
  }

  @override
  Widget movieDetails(int movieId) {
    return ChangeNotifierProvider(
        create: (_) => _diContainer._makeMovieDetailsModel(movieId),
        child: const MovieDetailsWidget());
  }

  @override
  Widget movieTrailer(String youtubeKey) {
    return MovieTrailerWidget(youtubeKey: youtubeKey);
  }

  @override
  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => _diContainer._makeMovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

  @override
  Widget makeMovieFavorite() {
    return ChangeNotifierProvider(
      create: (_) => _diContainer._makeMovieFavoriteViewModel(),
      child: const MovieFavoriteWidget(),
    );
  }

  @override
  Widget makeMovieHome() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _diContainer._makeMovieHomeUpcomingViewModel()),
        ChangeNotifierProvider(create: (_) => _diContainer._makeMovieHomeActorViewModel()),
      ],
      child: const MovieHomeWidget(),
    );
  }

  // @override
  // Widget makeMovieActor() {
  //   return ChangeNotifierProvider(
  //     create: (_) => _diContainer._makeMovieHomeActorViewModel(),
  //     child: const MovieHomeWidget(),
  //   );
  // }
}
