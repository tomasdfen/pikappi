import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pikappi/screens/quiz/quizHome.dart';
import 'package:pikappi/screens/settings/Settings.dart';
import '../../Widgets/ImageButton.dart';
import '../../Widgets/AlertButton.dart';
import '../../Models/pokemon.dart';
import '../../Widgets/ScreenSize.dart';
import 'dart:math';
import '../../app.dart';
import 'dialog.dart';
import '../settings/UserSettings.dart';
import '../../DataBase/connection.dart';



@override
class Home extends StatefulWidget {
  _Home createState() => _Home();
}
String name = 'Nombre Entrenador';

class FavoritePokemon extends StatelessWidget {
  String _favPokeSprite = "";

  Future<String> more() async {
    int favnumber = await getFavPokemon();
    Pokemon poke = await fetchPokemon(
        "https://pokeapi.co/api/v2/pokemon/${favnumber}/");
    return poke.prettySprite;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: more(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Center(
              child: Container(
                  width: 180,
                  height: 180,
                  child:SvgPicture.network(snapshot.data,
                                height: 30, width: 30)),
                      )
              : CircularProgressIndicator();
        });
  }
}

String num_entr = '0';
AssetImage perfil;

class _Home extends State<Home> {
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
                child: FavoritePokemon()),
            BottomRow(),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(0, 13.0, 9.0, 0),
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, UserSettingsRoute);
            },
            child: FotoPerfil(),
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }}


  class BottomRow extends StatefulWidget {
  _BottomRow createState() => _BottomRow();
  }

  class _BottomRow extends State<BottomRow> {
  @override
  Widget build(BuildContext context) {
  return Container(
  padding: EdgeInsets.all(28.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  //children: <Widget>[]..addAll(_list),
  children: <Widget>[
  ImageButton('settings.png', 75, SettingsRoute, 'Settings'),
  AlertButton('pokeball.png', 123),
  ImageButton('pokedex.png', 75, PokedexRoute, 'Pokedex')
  ],
  ),
  );
  }
  }

  _alertDialog(BuildContext context) {
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return BeautifulAlertDialog();
  },
  );
  }

  class FotoPerfil extends StatefulWidget{
  _FotoPerfil createState() => _FotoPerfil();
  }
  class _FotoPerfil extends State<FotoPerfil>{


    @override
    Widget build(BuildContext context) {
      getUser().then((result) {
        num_entr = result['trainer'];
      });

      return CircleAvatar(
        radius: 25,
        child:ClipOval(
          child:Image.asset('assets/trainers/' + num_entr + '.png', fit: BoxFit.cover, alignment:FractionalOffset.topCenter)
        ),
      );

}}
