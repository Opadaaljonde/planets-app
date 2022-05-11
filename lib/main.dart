


import 'package:flutter/material.dart';
import 'package:planets_app/colors_use.dart';
import 'package:planets_app/data_planets.dart';
import 'package:planets_app/start.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

import 'info_planet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 /* SharedPreferences x = await SharedPreferences.getInstance();
  bool b = x.getBool('enter');
  runApp(b ? MyApp() : Start());*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Flutter Planets',
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientendColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientstartColor, gradientendColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'Avenir'),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Solar System',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x7cdbf1ff),
                                  fontFamily: 'Avenir'),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        onChanged: (val) {},
                        underline: SizedBox()),
                  ],
                ),
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.only(left: 32.0),
              child: Swiper(
                itemCount: plants.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8)),
                layout: SwiperLayout.STACK,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
                        return InfoPlanet(plants[i]);
                      }));
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Card(
                              color: Colors.white,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      plants[i].name,
                                      style: TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff47455f),
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
                                    SizedBox(
                                      height: 32,
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Know more',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: secondaryTextColor,
                                            fontFamily: 'Avenir'),
                                        textAlign: TextAlign.left,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward,
                                        color: secondaryTextColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Hero(
                          tag: plants[i].position,
                          child: Image.asset(
                            plants[i].icon,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        color: navgationColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.star), onPressed: () {}),
            IconButton(icon: Icon(Icons.star), onPressed: () {}),
            IconButton(icon: Icon(Icons.star), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
