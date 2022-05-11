import 'package:flutter/material.dart';
import 'package:planets_app/colors_use.dart';
import 'package:planets_app/data_planets.dart';

class InfoPlanet extends StatelessWidget {
  final Planet curryplanet;

  InfoPlanet(this.curryplanet);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                      ),
                      Text(
                        curryplanet.name,
                        style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: primaryTextColor,
                            fontFamily: 'Avenir'),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Solar System',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: primaryTextColor,
                            fontFamily: 'Avenir'),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        curryplanet.description,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: contentTextColor,
                            fontFamily: 'Avenir'),
                        textAlign: TextAlign.left,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    'Gallary',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: contentTextColor,
                        fontFamily: 'Avenir'),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 32.0),
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: curryplanet.images.length,
                      itemBuilder: (ctx, i) {
                        return AspectRatio(
                          aspectRatio: 1,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(curryplanet.images[i],
                                  fit: BoxFit.cover)),
                        );
                      }),
                )
              ],
            ),
          ),
          Positioned(right: -64, child: Hero(tag:curryplanet.position,child: Image.asset(curryplanet.icon))),
          Positioned(
            top: 60,
            left: 32,
            child: Text(
              curryplanet.position.toString(),
              style: TextStyle(
                  fontSize: 247,
                  fontWeight: FontWeight.w900,
                  color: primaryTextColor.withOpacity(0.08),
                  fontFamily: 'Avenir'),
              textAlign: TextAlign.left,
            ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    ));
  }
}
