import 'package:flutter/material.dart';
import 'package:movieapp/domain/api_client/image_downloader.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_view_model.dart';
import 'package:provider/provider.dart';

class MovieHomeUpcomingWidget extends StatefulWidget {
  const MovieHomeUpcomingWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeUpcomingWidget> createState() =>
      _MovieHomeUpcomingWidgetState();
}

class _MovieHomeUpcomingWidgetState extends State<MovieHomeUpcomingWidget> {
  @override
  void didChangeDependencies() {
    context.read<MovieHomeUpcomingViewModel>().loadUpcomingMovies();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const _UpcomingBuilderWidget();
  }
}

class _UpcomingBuilderWidget extends StatelessWidget {
  const _UpcomingBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 10, left: 10),
          child: Text(
            'Watch these films in the cinema:',
            maxLines: 2,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white70,),
          ),
        ),
        _UpcomingListViewWidget(),
      ],
    );
  }
}

class _UpcomingListViewWidget extends StatelessWidget {
  const _UpcomingListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieHomeUpcomingViewModel>();
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 160,
        itemCount: model.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return _UpcomingDetailsWidget(index: index);
        },
      ),
    );
  }
}

class _UpcomingDetailsWidget extends StatelessWidget {
  final int index;

  const _UpcomingDetailsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieHomeUpcomingViewModel>();
    final movie = model.movies[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(24, 23, 27, 1),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (movie.posterPath != null)
                      Image.network(
                        ImageDownloader.imageUrl(movie.posterPath!),
                        width: double.infinity,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 9),
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      model.stringFromDate(movie.releaseDate),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => model.upcomingOnMovieTap(context, index),
            ),
          )
        ],
      ),
    );
  }
}
