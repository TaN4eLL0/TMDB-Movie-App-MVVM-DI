import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';

class MovieHomeSeriesWidget extends StatefulWidget {
  const MovieHomeSeriesWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeSeriesWidget> createState() => _MovieHomeSeriesWidgetState();
}

class _MovieHomeSeriesWidgetState extends State<MovieHomeSeriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemExtent: 137,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 2),
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.peakyblinders),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              'Peaky Blinders (6 season)',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'February 27, 2022',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Season release timer (N)',
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
