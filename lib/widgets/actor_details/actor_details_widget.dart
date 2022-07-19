import 'package:flutter/material.dart';
import 'package:movieapp/domain/api_client/image_downloader.dart';
import 'package:movieapp/widgets/actor_details/actor_details_view_model.dart';
import 'package:provider/provider.dart';

class ActorDetailsWidget extends StatefulWidget {
  const ActorDetailsWidget({Key? key}) : super(key: key);

  @override
  State<ActorDetailsWidget> createState() => _ActorDetailsWidgetState();
}

class _ActorDetailsWidgetState extends State<ActorDetailsWidget> {
  @override
  void didChangeDependencies() {
    context.read<ActorDetailsViewModel>().loadDetails();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 27, 1),
      appBar: AppBar(),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _InfoWidget(),
        SizedBox(height: 20),
        _ActorMovieWidget(),
        SizedBox(height: 20),
        _BiographyWidget(),
      ],
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profilePath = context.select(
        (ActorDetailsViewModel model) => model.data.profileData.profilePath);

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Row(
        children: [
          profilePath != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      ImageDownloader.imageUrl(profilePath),
                      // width: ,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            width: 50,
          ),
          const _TextInfoWidget(),
        ],
      ),
    );
  }
}

class _TextInfoWidget extends StatelessWidget {
  const _TextInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _styleApi = TextStyle(color: Colors.white, fontSize: 16);
    const styleInfo = TextStyle(color: Colors.white70, fontSize: 18);

    final data = context.watch<ActorDetailsViewModel>().data;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Date of Birth:',
              style: styleInfo,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              data.birthday!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: _styleApi,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Place of Birth:',
              style: styleInfo,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              data.placeOfBirth!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: _styleApi,
            ),
            const SizedBox(
              height: 5,
            ),
            data.homePage != null
                ? IconButton(
                    icon: const Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    tooltip: 'actor home page',
                    iconSize: 24,
                    splashRadius: 24,
                    onPressed: () => data.homePage,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _ActorMovieWidget extends StatelessWidget {
  const _ActorMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context
        .select((ActorDetailsViewModel model) => model.data.movie.length);
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: model,
        itemExtent: 160,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _BodyListViewMovieWidget(
            movieIndex: index,
          );
        },
      ),
    );
  }
}

class _BodyListViewMovieWidget extends StatelessWidget {
  final int movieIndex;

  const _BodyListViewMovieWidget({
    Key? key,
    required this.movieIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context
        .select((ActorDetailsViewModel model) => model.data.movie[movieIndex]);
    final model = context.watch<ActorDetailsViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(20),
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
                    if (data.posterPath != null)
                      Image.network(
                        ImageDownloader.imageUrl(data.posterPath!),
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        data.character,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
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
                borderRadius: BorderRadius.circular(20),
                onTap: () =>
                    model.favoriteOnActorMovieTap(context, movieIndex)),
          )
        ],
      ),
    );
  }
}

class _BiographyWidget extends StatelessWidget {
  const _BiographyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _styleApi = TextStyle(color: Colors.white, fontSize: 16);
    const _styleInfo = TextStyle(color: Colors.white70, fontSize: 18);

    final biography =
        context.select((ActorDetailsViewModel model) => model.data.biography);
    return Column(
      children: [
        const Text(
          'Biography:',
          style: _styleInfo,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          biography!,
          textAlign: TextAlign.center,
          style: _styleApi,
        ),
      ],
    );
  }
}
