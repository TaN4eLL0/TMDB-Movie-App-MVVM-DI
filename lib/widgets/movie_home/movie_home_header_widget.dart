import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';

class MovieHomeHeaderWidget extends StatelessWidget {
  const MovieHomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(AppImages.headerMovie),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.luminosity,
            )),
      ),
      height: 550,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Text(
          'Welcome to the movie database!'
          ' Here you can find any movie you are interested in and not only...',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
