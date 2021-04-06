import 'package:flutter/material.dart';
import '../../Widgets/ImageButton.dart';
import '../../Models/pokemon.dart';
import 'dart:math';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ImageButton> listaBotones = [];
    listaBotones.add(ImageButton('settings.png', 100));
    listaBotones.add(ImageButton('pokeball.png', 150));
    listaBotones.add(ImageButton('pokedex.png', 100));

    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundDay.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(alignment: Alignment.topRight,
              child: TopRow('assets/trainers/' + 'trainer_1' + '.png')),
            Container(
                height: 220,
                child: Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${Random().nextInt(151) + 1}.png",
                  fit: BoxFit.fill,
                )),
            BottomRow(listaBotones),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BottomRow extends StatelessWidget {
  final List<ImageButton> _list;

  BottomRow(this._list);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[]..addAll(_list),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  final String _imagen;

  TopRow(this._imagen);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xffff3030),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(_imagen),
                  backgroundColor: Color(0xffffffff),
                ))
          ]),
    );
  }
}
