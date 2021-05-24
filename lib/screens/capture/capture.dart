import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
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
  double height = 140;
  double width = 120;

  double posLeft = 0;
  double posRight = 0;
  double posTop = 0;
  double posBottom = -400.0;

  bool res = false;
  void _move() {
    if (res == false) {
      setState(() {
        posLeft = 0;
        posRight = 0;
        posTop = 0;
        posBottom = 0.0;
        res = true;
        height = 20;
        width = 20;
      });
    } else {
      setState(() {
        posLeft = 0;
        posRight = 0;
        posTop = 0;
        posBottom = -400.0;
        res = false;
        height = 140;
        width = 120;
      });
    }
  }

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
            Center(
              child: GestureDetector(
                child: AnimatedContainer(
                    height: height,
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.easeInOutExpo,
                    alignment: Alignment.center,
                    child: ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.modulate),
                      child: Image.network(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.number}.png",
                        height: 140,

                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
            AnimatedPositioned(
              left: posLeft,
              bottom: posBottom,
              right: posRight,
              top: posTop,
              duration: const Duration(milliseconds: 1600),
              curve: Curves.easeInOutBack,
              child: Center(
                child: Image(
                  width: 110,
                  height: 110,
                  image: AssetImage(
                    "assets/images/pokeball.png",
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  _move();
                },
                child: Text("Capture!"),
              ),
            ),
            /*Align(
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
                  duration: Duration(milliseconds: 80),
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
                        setState(() => height = height == 100 ? 150 : 100),
                  ),
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
