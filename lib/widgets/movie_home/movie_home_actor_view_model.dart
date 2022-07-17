import 'package:flutter/cupertino.dart';
import 'package:movieapp/domain/entity/actor_popular.dart';
import 'package:movieapp/domain/entity/actor_popular_knownfor.dart';
import 'package:movieapp/domain/entity/actor_popular_results.dart';

abstract class MovieUpcomingViewModelLoadActor {
  Future<ActorPopular> loadActor();
}

// class MakeKnownData {
//   final String? originalTitle;
//   final String? title;
//
//   MakeKnownData({
//     required this.originalTitle,
//     required this.title,
//   });
// }

class MovieHomeActorViewModel extends ChangeNotifier {
  final MovieUpcomingViewModelLoadActor loadActor;
  final actor = <Results>[];
  final known = <KnownFor>[];

  MovieHomeActorViewModel({required this.loadActor});

  // Future<void> loadKnown(KnownFor knownFor) async {
  //
  // }

  Future<void> loadActorsPopular() async {
    final actorResponse = await loadActor.loadActor();
    actor.addAll(actorResponse.actor);
    // known.addAll(actorResponse.actor[index].knownFor);
    notifyListeners();
  }
}
