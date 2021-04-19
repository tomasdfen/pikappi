import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikappi/Models/pokemon.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

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
    switch (p.types[0]) {
      case "fire":
        {
          cellColor = Colors.amber[900];
        }
        break;
      case "grass":
        {
          cellColor = Colors.green;
        }
        break;
      case "water":
        {
          cellColor = Colors.blue;
        }
        break;
      case "bug":
        {
          cellColor = Colors.lightGreen;
        }
        break;
      case "flying":
        {
          cellColor = Colors.lightBlue[100];
        }
        break;
      case "poison":
        {
          cellColor = Colors.purple;
        }
        break;
      case "rock":
        {
          cellColor = Colors.grey[800];
        }
        break;
      case "steel":
        {
          cellColor = Colors.grey;
        }
        break;
      case "ice":
        {
          cellColor = Colors.blueAccent[100];
        }
        break;
      case "ground":
        {
          cellColor = Colors.brown[400];
        }
        break;
      case "dragon":
        {
          cellColor = Colors.blue[900];
        }
        break;
      case "dark":
        {
          cellColor = Colors.black87;
        }
        break;
      case "ghost":
        {
          cellColor = Colors.grey[850];
        }
        break;
      case "fairy":
        {
          cellColor = Colors.pinkAccent;
        }
        break;
      case "psychic":
        {
          cellColor = Colors.pink;
        }
        break;
      case "electric":
        {
          cellColor = Colors.yellow;
        }
        break;
      case "fighting":
        {
          cellColor = Colors.amber;
        }
        break;

      default:
        {
          cellColor = Colors.white;
        }
        break;
    }
    var elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: cellColor,
      ),
      child: Column(
        children: <Widget>[
          SvgPicture.network(
            p.getPrettySprite,
            height: SizeConfig.blockSizeVertical * 30,
            width: SizeConfig.blockSizeHorizontal * 30,
          ),
          Text('${p.name[0].toUpperCase()}${p.name.substring(1)}'),
        ],
      ),
      onPressed: () {
        print('Pokémon #${p.getNumber}');
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
