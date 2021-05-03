import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikappi/Models/pokemon.dart';
import 'package:pikappi/screens/details/details.dart';

import '../../app.dart';


class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final title = "Pokedex";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(151, (index) {
          return FutureBuilder(
              future: fetchPokemon(
                  "https://pokeapi.co/api/v2/pokemon/${index + 1}/"),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? PokedexCell(p: snapshot.data)
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

  PokedexCell({Key key, this.p}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cellColor = getTypeColor(p.types[0]);
    var elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: cellColor,
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SvgPicture.network(
              p.getPrettySprite,
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.blockSizeHorizontal * 30,
            ),
          ),
          Text('${p.name[0].toUpperCase()}${p.name.substring(1)}'),
        ],
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(pokemon: p, color: cellColor)));
      },
    );
    return Center(
        child: ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: SizeConfig.blockSizeVertical * 33,
        width: SizeConfig.blockSizeHorizontal * 33,
      ),
      child: elevatedButton,
    ));
  }
}
