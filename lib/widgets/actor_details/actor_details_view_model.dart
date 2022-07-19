import 'package:flutter/material.dart';
import 'package:movieapp/domain/entity/actor_details.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';

class ActorDetailsProfileData {
  final String? profilePath;

  ActorDetailsProfileData({
    this.profilePath,
  });
}

class ActorDetailsMovieData {
  final String character;
  final String title;
  final String? posterPath;
  final int id;

  ActorDetailsMovieData({
    required this.id,
    required this.character,
    required this.title,
    this.posterPath,
  });
}

class ActorDetailsData {
  ActorDetailsProfileData profileData = ActorDetailsProfileData();
  bool isLoading = true;
  String name = '';
  String? birthday = '';
  String? placeOfBirth = '';
  String? homePage = '';
  String? biography = '';
  List<ActorDetailsMovieData> movie = const <ActorDetailsMovieData>[];
}

abstract class ActorDetailsViewModelLoad {
  Future<ActorDetails> actorDetails({
    required int personId,
  });
}

class ActorDetailsViewModel extends ChangeNotifier {
  final ActorDetailsViewModelLoad actorProvider;
  final actor = <ActorDetails>[];

  final int personId;
  final data = ActorDetailsData();

  ActorDetailsViewModel(
    this.personId, {
    required this.actorProvider,
  });

  Future<void> updateData(ActorDetails details) async {
    data.name = details.name ?? 'No Name';
    data.isLoading = details == null;
    if (details == null) {
      notifyListeners();
      return;
    }
    data.placeOfBirth = details.placeOfBirth ?? 'We do not know';
    data.birthday = details.birthday ?? 'We do not know';
    data.homePage = details.homepage;
    data.biography = details.biography;
    data.profileData = ActorDetailsProfileData(
      profilePath: details.profilePath,
    );

    data.movie = details.movieCredits.cast
        .map((e) => ActorDetailsMovieData(
              title: e.title,
              character: e.character,
              posterPath: e.posterPath,
              id: e.id,
            ))
        .toList();

    notifyListeners();
  }

  Future<void> loadDetails() async {
    final details = await actorProvider.actorDetails(
      personId: personId,
    );
    updateData(details);
    notifyListeners();
  }

  void favoriteOnActorMovieTap(BuildContext context, int index) {
    final id = data.movie[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }
}
