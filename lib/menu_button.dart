import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MnueButton extends StatefulWidget {
  @override
  _MnueButtonState createState() => _MnueButtonState();
}

class _MnueButtonState extends State<MnueButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationcontroller;
  Animation _animtion;

  @override
  void initState() {
    _animationcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animtion = Tween(begin: 0.0, end: 1.0).animate(_animationcontroller);
    _animtion.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX:
                    _animationcontroller.isDismissed ? 0 : _animtion.value * 5,
                sigmaY:
                    _animationcontroller.isDismissed ? 0 : _animtion.value * 5),
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(decoration: InputDecoration(hintText: "F-Name")),
                  TextField(decoration: InputDecoration(hintText: "L-Name")),
                  TextField(decoration: InputDecoration(hintText: "E-mail"))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Stack(
              children: [
                Transform.translate(
                    offset: Offset.fromDirection(pi, _animtion.value * 100),
                    child: option(Colors.red, () {}, Icon(Icons.translate))),
                Transform.translate(
                  offset:
                      Offset.fromDirection(pi * 5 / 4, _animtion.value * 100),
                  child: option(Colors.amber, () {}, Icon(Icons.home)),
                ),
                Transform.translate(
                  offset:
                      Offset.fromDirection(pi * 3 / 2, _animtion.value * 100),
                  child: option(Colors.purple, () {}, Icon(Icons.access_alarm)),
                ),
                option(Colors.pink, () {
                  if (_animationcontroller.isCompleted) {
                    _animationcontroller.reverse();
                  } else {
                    _animationcontroller.forward();
                  }
                }, Icon(Icons.add)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container option(Color color, Function fun, icon) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: icon,
          onPressed: fun,
          color: Colors.white,
        ));
  }
}
