import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MovieHomeDescriptionWidget extends StatelessWidget {
  MovieHomeDescriptionWidget({Key? key}) : super(key: key);

  final _style =
      TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(24, 23, 27, 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'About company',
                      style: _style,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Contacts editions',
                      style: _style,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy policy',
                      style: _style,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Advertising',
                      style: _style,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Telegram',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Facebook',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Twitter',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Instagram',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
