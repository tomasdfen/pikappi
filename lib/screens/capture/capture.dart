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
  double height = 100;

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      appBar: AppBar(title: Text('Home Page')),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
        vsync: this,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 120,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black, BlendMode.modulate),
                            child: Image.network(
                              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.number}.png",
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ],
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: height,
                  width: height,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // background// foreground
                      ),
                    child: Container(
                        color: Colors.transparent,
                        child: Image.asset("assets/images/pokeball.png")),
                    onPressed: () =>
                        setState(() => height = height == 100 ? 200 : 100),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
