import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';

class MovieHomeBlocWidget extends StatefulWidget {
  const MovieHomeBlocWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeBlocWidget> createState() => _MovieHomeBlocWidgetState();
}

class _MovieHomeBlocWidgetState extends State<MovieHomeBlocWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: PageView(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Movie, series and more without sms and registration ♡',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    bottom: 10,
                    child: Container(
                      height: 120,
                      width: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CupertinoContextMenu(
                          actions: <Widget>[
                            CupertinoContextMenuAction(
                              child: Text('Registration'),
                              onPressed: () {},
                            )
                          ],
                          child: Container(
                            child: Image(
                              image: AssetImage(AppImages.piratemovie),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'You can register to be notified when movies are released in HD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    bottom: 10,
                    child: Container(
                      height: 120,
                      width: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CupertinoContextMenu(
                          actions: <Widget>[
                            CupertinoContextMenuAction(
                              child: Text('Registration'),
                              onPressed: () {},
                            )
                          ],
                          child: Container(
                            child: Image(
                              image: AssetImage(AppImages.piratemovie),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
