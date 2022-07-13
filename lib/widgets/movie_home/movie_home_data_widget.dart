import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';


class MovieHomeDataWidget extends StatefulWidget {
  const MovieHomeDataWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeDataWidget> createState() => _MovieHomeDataWidgetState();
}

class _MovieHomeDataWidgetState extends State<MovieHomeDataWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 137,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 2),
                      color: Colors.black.withOpacity(0.2),
                    ),],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AppImages.morbius2,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              'Morbius',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'January 28, 2022',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Movie release timer (N)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
