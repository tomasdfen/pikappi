import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikappi/Models/pokemon.dart';

import '../../app.dart';

class Details extends StatelessWidget {
  Pokemon pokemon;
  Color color;

  Details({
    this.pokemon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}'),
          backgroundColor: color,
        ),
        body: Column(
          children: [
            Center(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: SvgPicture.network(
                    pokemon.prettySprite,
                    height: SizeConfig.blockSizeVertical * 30,
                    width: SizeConfig.blockSizeHorizontal * 30,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 40),
              ),
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: (pokemon.types.length == 2)
                      ? [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              '${pokemon.types[0][0].toUpperCase()}${pokemon.types[0].substring(1)}',
                              style: TextStyle(
                                  color: getTypeColor(pokemon.types[0]),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Open Sans',
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              '${pokemon.types[1][0].toUpperCase()}${pokemon.types[1].substring(1)}',
                              style: TextStyle(
                                  color: getTypeColor(pokemon.types[1]),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Open Sans',
                                  fontSize: 20),
                            ),
                          ),
                        ]
                      : [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              '${pokemon.types[0][0].toUpperCase()}${pokemon.types[0].substring(1)}',
                              style: TextStyle(
                                  color: getTypeColor(pokemon.types[0]),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Open Sans',
                                  fontSize: 20),
                            ),
                          )
                        ]),
            ),
          ],
        ));
  }
}
