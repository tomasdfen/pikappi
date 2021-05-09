// app.dart

import 'package:flutter/material.dart';
import 'package:pikappi/screens/home/home.dart';
import 'screens/home/home.dart';
import 'screens/pokedex/pokedex.dart';
import 'screens/settings/Settings.dart';

const LocationsRoute = '/home';
const LocationDetailRoute = '/location_detail';
const PokedexRoute = '/pokedex';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Settings(),
      onGenerateRoute: _routes(),
    );
  }
  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Home();
          break;
        case LocationDetailRoute:
          //screen = LocationDetail(arguments['id']);
          break;
        case PokedexRoute:
          screen = Pokedex();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  /*ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        textTheme: TextTheme(
          title: TitleTextStyle,
          subtitle: SubTitleTextStyle,
          caption: CaptionTextStyle,
          body1: Body1TextStyle,
        ));
  }*/
}
