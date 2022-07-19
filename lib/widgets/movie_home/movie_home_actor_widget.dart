import 'package:flutter/material.dart';
import 'package:movieapp/domain/api_client/image_downloader.dart';
import 'package:movieapp/widgets/movie_home/movie_home_actor_view_model.dart';
import 'package:provider/provider.dart';

class MovieHomeActorWidget extends StatefulWidget {
  const MovieHomeActorWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeActorWidget> createState() => _MovieHomeActorWidgetState();
}

class _MovieHomeActorWidgetState extends State<MovieHomeActorWidget> {
  @override
  void didChangeDependencies() {
    context.read<MovieHomeActorViewModel>().loadActorsPopular();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const _ActorBuilderWidget();
  }
}

class _ActorBuilderWidget extends StatelessWidget {
  const _ActorBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 10),
              child: Text(
              'Popular actor today:',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white70,),
              ),
            ),
          ],
        ),
        const _ActorListViewWidget(),
      ],
    );
  }
}

class _ActorListViewWidget extends StatelessWidget {
  const _ActorListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieHomeActorViewModel>();
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.actor.length,
        itemExtent: 160,
        itemBuilder: (BuildContext context, int index) {
          return _ActorDetailsWidget(actorIndex: index);
        },
      ),
    );
  }
}

class _ActorDetailsWidget extends StatelessWidget {
  final int actorIndex;

  const _ActorDetailsWidget({
    Key? key,
    required this.actorIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieHomeActorViewModel>();
    final actor = model.actor[actorIndex];
    final title = actor.knownFor[0].title ?? '';
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
                    if (actor.profilePath != null)
                      Image.network(
                        ImageDownloader.imageUrl(actor.profilePath!),
                        width: double.infinity,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        actor.name,
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
                        title,
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
              borderRadius: BorderRadius.circular(10),
              onTap: () => model.onActorTap(context, actorIndex),
            ),
          )
        ],
      ),
    );
  }
}
