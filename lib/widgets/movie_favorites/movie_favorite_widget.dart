import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movieapp/domain/api_client/image_downloader.dart';
import 'package:movieapp/widgets/main_screen/main_screen_view_model.dart';
import 'package:movieapp/widgets/movie_favorites/movie_favorite_model.dart';
import 'package:provider/provider.dart';

class MovieFavoriteWidget extends StatefulWidget {
  const MovieFavoriteWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieFavoriteWidget> createState() => _MovieFavoriteWidgetState();
}

class _MovieFavoriteWidgetState extends State<MovieFavoriteWidget> {
  @override
  void didChangeDependencies() {
    context.read<MovieFavoriteViewModel>().loadMoviesFavorite();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _model = context.read<MainScreenViewModel>();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text(
          'MovieApp',
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
            onPressed: () => _model.logoutAccount(context),
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: const _MovieListWidget(),
    );
  }
}

class _MovieListWidget extends StatelessWidget {
  const _MovieListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieFavoriteViewModel>();
    return ListView.builder(
      itemCount: model.movies.length,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        return _MovieRowWidget(index: index);
      },
    );
  }
}

class _MovieRowWidget extends StatelessWidget {
  final int index;

  const _MovieRowWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieFavoriteViewModel>();
    final delete = context.watch<MovieFavoriteViewModel>();
    final movie = model.movies[index];
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        openThreshold: 0.1,
        motion: const ScrollMotion(),
        children: [
          SizedBox(
            width: 70,
            height: 144,
            child: SlidableAction(
              onPressed: (context) => delete.deleteFavoriteMovie(index),
              backgroundColor: const Color.fromRGBO(24, 23, 27, 1),
              icon: Icons.delete,
              foregroundColor: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(24, 23, 27, 1),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  if (movie.posterPath != null)
                    Image.network(
                      ImageDownloader.imageUrl(movie.posterPath!),
                      width: 95,
                    ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          model.stringFromDate(movie.releaseDate),
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: () => model.favoriteOnMovieTap(context, index),
              ),
            )
          ],
        ),
      ),
    );
  }
}
