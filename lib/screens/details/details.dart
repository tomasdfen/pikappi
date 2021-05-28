import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikappi/DataBase/connection.dart';
import 'package:pikappi/Models/pokemon.dart';

import '../../app.dart';

void _showToast(BuildContext context, Pokemon p) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text('${p.name} es tu nuevo Pokémon favorito'),
    ),
  );
}

class Details extends StatelessWidget {
  Pokemon pokemon;
  Color color;
  Map<String, String> details = {};
  Details({
    this.pokemon,
    this.color,
  });

  void fillDetails() async {
    this.details['desc'] = await fetchPokemonDesc(pokemon.number);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    this.fillDetails();
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}'),
          backgroundColor: color,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
              child: FutureBuilder(
            future: fetchPokemonDesc(pokemon.number),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? Text(
                      snapshot.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Open Sans',
                          fontSize: 14),
                    )
                  : LinearProgressIndicator();
            },
          )),
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
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Table(children: <TableRow>[
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'HP: ${pokemon.hp}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.lightGreen),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Attack: ${pokemon.atk}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.amber),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Defense: ${pokemon.def}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blue),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sp. Attk: ${pokemon.spAtk}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.red[300]),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sp. Def: ${pokemon.spAtk}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.amber[700]),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Speed: ${pokemon.spd}',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.lightBlue),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          animationDuration: Duration.zero,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent))))),
                ),
              ]),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.favorite_border),
                  onPressed: () {
                    _showToast(context, pokemon);
                    updateFavPokemon(this.pokemon.number);
                  },
                  backgroundColor: Colors.pink,
                ),
              )
            ],
          )
        ]));
  }
}
