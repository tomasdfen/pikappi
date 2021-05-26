// app.dart

import 'package:flutter/material.dart';
import 'package:pikappi/screens/capture/capture.dart';
import 'package:pikappi/screens/home/home.dart';
import 'package:pikappi/screens/quiz/quizHome.dart';
import 'screens/home/home.dart';
import 'screens/home/dialog.dart';
import 'screens/pokedex/pokedex.dart';
import 'screens/settings/Settings.dart';
import 'screens/quiz/quiz_page.dart';
import 'screens/settings/UserSettings.dart';

const LocationsRoute = '/home';
const LocationDetailRoute = '/location_detail';
const PokedexRoute = '/pokedex';
const SettingsRoute = '/settings';
const QuizRoute = '/quiz';
const UserSettingsRoute = '/usersettings';
const CaptureRoute = '/capture';

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

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent),
      home: Home(),
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
          screen = PokedexView();
          break;
        case QuizRoute:
          screen = QuizHomePage();
          break;
        case SettingsRoute:
          screen = Settings();
          break;
        case UserSettingsRoute:
          screen = UserSettings();
          break;
        case CaptureRoute:
          screen = CapturePokemon();
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
