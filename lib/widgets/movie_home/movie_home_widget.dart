import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/widgets/main_screen/main_screen_view_model.dart';
import 'package:movieapp/widgets/movie_home/movie_home_actor_widget.dart';
import 'package:movieapp/widgets/movie_home/movie_home_header_widget.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_widget.dart';

class MovieHomeWidget extends StatefulWidget {
  const MovieHomeWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeWidget> createState() => _MovieHomeWidgetState();
}

class _MovieHomeWidgetState extends State<MovieHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text(
          'MovieApp',
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
              onPressed: () => model.logoutAccount(context),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const MovieHomeHeaderWidget(),
              Container(width: double.infinity, height: 10, color: Colors.white10,),
              const MovieHomeUpcomingWidget(),
              const MovieHomeActorWidget(),
            ],
          )
        ],
      ),
    );
  }
}
