import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:pikappi/Models/pokemon.dart';
import '../../app.dart';
import 'package:flutter/cupertino.dart';

class CapturePokemon extends StatefulWidget {
  final Map<int, dynamic> answers;
  final Pokemon pokemon;

  CapturePokemon({Key key, @required this.answers, this.pokemon})
      : super(key: key);

  @override
  _CapturePokemon createState() => new _CapturePokemon();
}

class _CapturePokemon extends State<CapturePokemon>
    with TickerProviderStateMixin {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      appBar: AppBar(title: Text('Home Page')),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
        vsync: this,
        child: Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 120,
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.modulate),
                        child: Image.network(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${Random().nextInt(151) + 1}.png",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Container(
                      width: 250.0,
                      height: 250.0,
                      child: AnimatedAlign(
                        alignment: selected
                            ? Alignment.topRight
                            : Alignment.bottomLeft,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child: const FlutterLogo(size: 50.0),
                      )),
                  //BottomRow(),
                ],
              ),
            )),
      ),
    );
  }
}
