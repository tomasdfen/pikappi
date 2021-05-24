import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:pikappi/Models/pokemon.dart';
import '../../app.dart';
import 'package:flutter/cupertino.dart';

class CapturePokemon extends StatefulWidget{
  final Map<int, dynamic> answers;
  final Pokemon pokemon;

  CapturePokemon({Key key, @required this.answers, this.pokemon}): super(key: key);

  @override
  _CapturePokemon createState() => new _CapturePokemon();
}
class _CapturePokemon extends State<CapturePokemon> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      appBar: AppBar(title: Text('Home Page')),
      body: Align(alignment: Alignment.center,
          child:  Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 120,
                    child: Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${Random().nextInt(151) + 1}.png",
                      fit: BoxFit.fill,
                    )),
                //BottomRow(),
              ],
            ),
          )),
    );
  }
}
