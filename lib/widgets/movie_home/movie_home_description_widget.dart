import 'package:flutter/material.dart';

class MovieHomeDescriptionWidget extends StatelessWidget {
  const MovieHomeDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(24, 23, 27, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Telegram',
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Facebook',
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Twitter',
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Instagram',
            ),
          ),
        ],
      ),
    );
  }
}
