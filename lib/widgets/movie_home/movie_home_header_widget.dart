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
              Colors.black.withOpacity(0.4), BlendMode.luminosity,)
        ),
      ),
      height: 550,
      width: double.infinity,
      child: const Center(
        child: Text(
          'Welcome',
          style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
