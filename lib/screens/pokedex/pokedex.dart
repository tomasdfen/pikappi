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
    final title = 'Pokedex';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: fetchPokemon(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PokedexGrid(pokemonList: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PokedexGrid extends StatelessWidget {
  final List<Pokemon> pokemonList;

  PokedexGrid({Key key, this.pokemonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(151, (index) {
        return Center(
            child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: SizeConfig.blockSizeVertical * 33,
            width: SizeConfig.blockSizeHorizontal * 33,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
            ),
            child: Column(
              children: <Widget>[
                SvgPicture.network(
                  pokemonList[index].getSprite,
                  height: SizeConfig.blockSizeVertical * 30,
                  width: SizeConfig.blockSizeHorizontal * 30,
                ),
                Text("Pokémon #${index + 1}"),
              ],
            ),
            onPressed: () {
              print('Pokémon #$index');
            },
          ),
        ));
      }),
    );
  }
}

// class Pokedex extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future<List<Pokemon>> p = fetchPokemon();
//     SizeConfig().init(context);
//     final title = 'Pokédex';
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: GridView.count(
//         // Create a grid with 2 columns. If you change the scrollDirection to
//         // horizontal, this produces 2 rows.
//         crossAxisCount: 3,
//         // Generate 100 widgets that display their index in the List.
//         children: List.generate(151, (index) {
//           return Center(
//               child: ConstrainedBox(
//             constraints: BoxConstraints.tightFor(
//               height: SizeConfig.blockSizeVertical * 33,
//               width: SizeConfig.blockSizeHorizontal * 33,
//             ),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.lightGreen,
//               ),
//               child: Column(
//                 children: <Widget>[
//                   SvgPicture.network(
//                     "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${index + 1}.svg",
//                     height: SizeConfig.blockSizeVertical * 30,
//                     width: SizeConfig.blockSizeHorizontal * 30,
//                   ),
//                   Text("Pokémon #${index + 1}"),
//                 ],
//               ),
//               onPressed: () {
//                 print('Pokémon #$index');
//               },
//             ),
//           )
//               /*Text(
//                 'Pokémon #$index',
//                 style: Theme.of(context).textTheme.headline5,
//               */
//               );
//         }),
//       ),
//     );
//   }
// }
