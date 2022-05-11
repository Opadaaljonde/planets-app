import 'package:flutter/cupertino.dart';

class Planet {
  final int position;
  final String name;
  final String icon;
  final String description;
  final List<String> images;

  Planet({
    @required this.position,
    @required this.name,
    @required this.icon,
    @required this.description,
    @required this.images,
  });
}

List<Planet> plants = [
  Planet(
    position: 1,
    name: "Erthe",
    icon: 'Images/erthe.png',
    description: "this planet is one planet which pepole can life into it",
    images: [
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
    ],
  ),
   Planet(
    position: 2,
    name: "Almoshtry",
    icon: 'Image/Almoshtry.png',
    description: "this planet is pepole can't life into it",
    images: [
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
    ],
  ), Planet(
    position: 3,
    name: "Alzohra",
    icon: 'Image/Alzohra.png',
    description: "this planet is  pepole can life into it",
    images: [
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',
      'http://www.panets.com/erthe.png',

      'http://www.panets.com/erthe.png',
    ],
  ),
];
