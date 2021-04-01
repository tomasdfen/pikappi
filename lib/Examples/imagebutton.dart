import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String _url = getNewCatUrl();

  static String getNewCatUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cat Button'),
      ),
      body: new Center(
        child: new FloatingActionButton(
          onPressed: () {
            setState(() {
              _url = getNewCatUrl();
            });
          },
          child: new ConstrainedBox(
            constraints: new BoxConstraints.expand(),
            child: new Image.network(_url, fit: BoxFit.cover, gaplessPlayback: true),
          ),
        ),
      ),
    );
  }
}