import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikappi/DataBase/connection.dart';
import 'package:pikappi/Models/pokemon.dart';
import 'package:pikappi/screens/details/details.dart';

import '../../app.dart';

class PokedexView extends StatelessWidget {
  List<dynamic> captured;

  Future loadData() async {
    var data = getPokemonList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Pokedex(captured: snapshot.data)
              : Center(
                  child: Image.asset(
                  "assets/images/pikachu.gif",
                  height: 125.0,
                  width: 125.0,
                ));
        });
  }
}

class Pokedex extends StatelessWidget {
  final title = "Pokedex";
  List<dynamic> captured;
  Pokedex({Key key, this.captured}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(150, (index) {
          bool show = captured.contains(index +1);
          return FutureBuilder(
              future: fetchPokemon(
                  "https://pokeapi.co/api/v2/pokemon/${index + 1}/"),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? PokedexCell(p: snapshot.data, show: show)
                    : Center(child: CircularProgressIndicator());
              });
        }),
      ),
    );
  }
}

class PokedexCell extends StatelessWidget {
  final Pokemon p;
  var cellColor;
  bool show;

  PokedexCell({Key key, this.p, this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cellColor = getTypeColor(p.types[0]);
    var elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: cellColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SvgPicture.network(
              p.getPrettySprite,
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.blockSizeHorizontal * 30,
              color: this.show ? null : Colors.black,
            ),
          ),
          Text(this.show
              ? '${p.name[0].toUpperCase()}${p.name.substring(1)}'
              : '???'),
        ],
      ),
      onPressed: this.show
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Details(pokemon: p, color: cellColor)));
            }
          : null,
    );
    return Center(
        child: ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: SizeConfig.blockSizeVertical * 33,
        width: SizeConfig.blockSizeHorizontal * 33,
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.blockSizeHorizontal * 2,
              SizeConfig.blockSizeVertical * 1,
              SizeConfig.blockSizeHorizontal * 2,
              SizeConfig.blockSizeVertical * 1),
          child: elevatedButton),
    ));
  }
}
