import 'package:flutter/material.dart';
import 'package:pikappi/Models/pokemon.dart';
import 'category.dart';
import 'question.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'quiz_finished.dart';

class QuizPage extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_page.dart";
  final List<Question> questions;
  final Category category;
  final Pokemon pokemon;

  const QuizPage(
      {Key key, @required this.questions, this.category, this.pokemon})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: getTypeColor(widget.pokemon.types[0]),
          title: Text("PokeQuiz"),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: getTypeColor(widget.pokemon.types[0]),
                ),
                height: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          widget.questions[_currentIndex].question,
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map((option) => RadioListTile(
                              title: Text("$option"),
                              groupValue: _answers[_currentIndex],
                              value: option,
                              onChanged: (value) {
                                setState(() {
                                  _answers[_currentIndex] = option;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.modulate),
                          child: Image.network(
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.pokemon.number}.png",
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        backgroundImage:
                            AssetImage("assets/images/pokeball.png"),
                        backgroundColor: Colors.white,
                        minRadius: 60,
                        maxRadius: 60,
                      ),
                    ],
                  )),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: getTypeColor(widget.pokemon.types[0]),
                        textColor: Colors.white,
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Submit"
                                : "Next"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
              questions: widget.questions, answers: _answers, pokemon: widget.pokemon)));
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
