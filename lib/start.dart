import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:planets_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  var x = LiquidController();
  var currentpage = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      liquidController: x,
      onPageChangeCallback: (val) {
        setState(() {
          currentpage = val;
        });
      },
      pages: [
        item(
          Colors.deepPurple,
          'Info about planets',
          'images,poisition,far on sun,tempretuer,wethear',
        ),
        item(
          Colors.pink,
          'Info about planets',
          'images,poisition,far on sun,tempretuer,wethear',
        ),
        item(
          Colors.amber,
          'Info about planets',
          'images,poisition,far on sun,tempretuer,wethear',
        ),
        SizedBox(height: 70,),
        if (currentpage == 2)
          TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 500),
                builder: (ctx, op, child) {
                  return Opacity(
                    opacity: op,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amber,
                      ),
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setBool('enter', true);

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) {
                            return MyHomePage();
                          }),
                        );
                      },
                    ),
                  );
                })
          
      ],
    );
  }

  Container item(Color c, titel, subtitel) {
    return Container(
      color: c,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titel,
            style: TextStyle(
                color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitel,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 23,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
