import 'package:flutter/material.dart';
import '../../Widgets/ImageButton.dart';

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
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Icon(Icons.accessibility),
                  height: 10,
                ),
                Container(
                  child: Icon(Icons.account_balance),
                  height: 10,
                ),
              ],
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
