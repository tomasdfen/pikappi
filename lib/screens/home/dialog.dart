import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pikappi/Models/pokemon.dart';
import 'package:pikappi/screens/quiz/quizHome.dart';
import '../../Widgets/utils/network_image.dart';
import '../../Widgets/utils/git_assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app.dart';
import '../quiz/question.dart';
import '../quiz/demo_values.dart';
import '../quiz/quiz_page.dart';
import '../quiz/category.dart';
class BeautifulAlertDialog extends StatefulWidget {
  @override
  _BeautifulAlertDialog createState() => _BeautifulAlertDialog();
}

class _BeautifulAlertDialog extends State<BeautifulAlertDialog> {

  _onLocationTap(BuildContext context) {
    Navigator.pushNamed(context, QuizRoute);
  }

  _startQuiz() async {
    Pokemon p = await fetchPokemon("https://pokeapi.co/api/v2/pokemon/${Random().nextInt(150)+1}/").then((res) {
      return res;});
    List<Question> questions = await createQuestions(p).then((res) {
      return res;});

    Navigator.pop(context);
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) =>
                QuizPage(
                    questions: questions,
                    category: Category(
                        10,
                        '${p.name[0].toUpperCase()}${p.name.substring(1)}',
                        icon: FontAwesomeIcons.bookOpen),
                    pokemon: p)));
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: Image.asset("assets/images/pokebola.png"),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Alert!",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text("Wild Pokemon appeared, are you prepared?"),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("No"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Yes"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              _startQuiz();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
