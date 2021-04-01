import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Pokédex';

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(151, (index) {
            return Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  child: Column(
                    children: <Widget>[
                      SvgPicture.network(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${index + 1}.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      Text("Pokémon #$index"),
                    ],
                  ),
                  onPressed: () {
                    print('Pokémon #$index');
                  },
                )
              /*Text(
                'Pokémon #$index',
                style: Theme.of(context).textTheme.headline5,
              */
            );
          }),
        ),
      );
  }
}