import 'package:flutter/material.dart';
import '../../Widgets/ImageButton.dart';
import '../../Models/pokemon.dart';
import '../../Widgets/ScreenSize.dart';
import 'dart:math';
import '../../app.dart';
import '../home/home.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('Home Page')),
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
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(0, 13.0, 9.0, 0),
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {Navigator.pushNamed(context, PokedexRoute);},
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/trainers/' + 'trainer_1' + '.png',
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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


/*class TopRow extends StatelessWidget {
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
*/