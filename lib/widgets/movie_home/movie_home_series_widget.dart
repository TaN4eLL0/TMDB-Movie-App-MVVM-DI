import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_view_model.dart';
import 'package:provider/provider.dart';

class MovieHomeSeriesWidget extends StatefulWidget {
  const MovieHomeSeriesWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeSeriesWidget> createState() => _MovieHomeSeriesWidgetState();
}

class _MovieHomeSeriesWidgetState extends State<MovieHomeSeriesWidget> {
  @override
  void didChangeDependencies() {
    context.read<MovieHomeUpcomingViewModel>().loadActorsPopular();
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
    final model = context.watch<MovieHomeUpcomingViewModel>().listActor;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.length,
        itemExtent: 160,
        itemBuilder: (BuildContext context, int index) {
          return _ActorDetailsWidget(index: index);
        },
      ),
    );
  }
}

class _ActorDetailsWidget extends StatelessWidget {
  final int index;
  const _ActorDetailsWidget({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieHomeUpcomingViewModel>();
    final actor = model.listActor[index];
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
                    Image(image: AssetImage(AppImages.peakyblinders),),
                    SizedBox(height: 9),
                    Text(
                      actor.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 9),
                    Text(
                      'ddd',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5),
                    // Text(
                    //   movie.overview,
                    //   maxLines: 3,
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
