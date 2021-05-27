import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pikappi/DataBase/connection.dart';
import 'package:pikappi/Models/pokemon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pikappi/screens/details/details.dart';
import '../../app.dart';
import '../quiz/question.dart';
import '../quiz/demo_values.dart';
import '../quiz/quiz_page.dart';
import '../quiz/category.dart';
class CaptureAlertDialog extends StatefulWidget {
  final bool result;
  final Pokemon pokemon;

  CaptureAlertDialog({Key key, this.result, this.pokemon})
      : super(key: key);

  @override
  _BeautifulAlertDialog createState() => _BeautifulAlertDialog();
}

class _BeautifulAlertDialog extends State<CaptureAlertDialog> {
    String mensaje;

    _onLocationTap(BuildContext context, route) {
      Navigator.pushNamed(context, route);
    }

    Widget pokemonSprite(){
      return widget.result
          ? Image.network(
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.number}.png",
          height: 140,

          fit: BoxFit.fill,
        ): ColorFiltered(
        colorFilter:
        ColorFilter.mode(Colors.black, BlendMode.modulate),
        child: Image.network(
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.number}.png",
          height: 140,

          fit: BoxFit.fill,
        ),
      );
    }

    Widget viewPokemon() {
      return widget.result
          ? RaisedButton(
        child: Text("View Pokemon",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 12.0,
            )
        ),
        color: Colors.green,
        colorBrightness: Brightness.dark,
        onPressed: () {
          addPokemon(widget.pokemon.number);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Details(pokemon: widget.pokemon, color: getTypeColor(widget.pokemon.types[0]))));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
      )
          : Container();
    }

  @override
  Widget build(BuildContext context) {
    if(widget.result){
      mensaje = "Wild Pokemon " + widget.pokemon.name + " captured!";
    } else{ mensaje = "Oh no! Wild Pokemon escaped"; }

    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: pokemonSprite(),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(mensaje, style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("Go Home",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontSize: 12.0,
                                )),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              _onLocationTap(context, LocationsRoute);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: viewPokemon(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
