//questions taken from https://opentdb.com
import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pikappi/Models/pokemon.dart';

import 'category.dart';
import 'question.dart';

const Map<int, dynamic> demoAnswers = {
  0: "Multi Pass",
  1: 1,
  2: "Motherboard",
  3: "Cascading Style Sheet",
  4: "Marshmallow",
  5: "140",
  6: "Python",
  7: "True",
  8: "Jakarta"
};

final List<Category> categories = [
  Category(9, "General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(10, "Books", icon: FontAwesomeIcons.bookOpen),
  Category(11, "Film", icon: FontAwesomeIcons.video),
  Category(12, "Music", icon: FontAwesomeIcons.music),
  Category(13, "Musicals & Theatres", icon: FontAwesomeIcons.theaterMasks),
  Category(14, "Television", icon: FontAwesomeIcons.tv),
  Category(15, "Video Games", icon: FontAwesomeIcons.gamepad),
  Category(16, "Board Games", icon: FontAwesomeIcons.chessBoard),
  Category(17, "Science & Nature", icon: FontAwesomeIcons.microscope),
  Category(18, "Computer", icon: FontAwesomeIcons.laptopCode),
  Category(19, "Maths", icon: FontAwesomeIcons.sortNumericDown),
  Category(20, "Mythology"),
  Category(21, "Sports", icon: FontAwesomeIcons.footballBall),
  Category(22, "Geography", icon: FontAwesomeIcons.mountain),
  Category(23, "History", icon: FontAwesomeIcons.monument),
  Category(24, "Politics"),
  Category(25, "Art", icon: FontAwesomeIcons.paintBrush),
  Category(26, "Celebrities"),
  Category(27, "Animals", icon: FontAwesomeIcons.dog),
  Category(28, "Vehicles", icon: FontAwesomeIcons.carAlt),
  Category(29, "Comics"),
  Category(30, "Gadgets", icon: FontAwesomeIcons.mobileAlt),
  Category(31, "Japanese Anime & Manga"),
  Category(32, "Cartoon & Animation"),
];

final List<Question> demoQuestions = Question.fromData([
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "What does the \"MP\" stand for in MP3?",
    "correct_answer": "Moving Picture",
    "incorrect_answers": ["Music Player", "Multi Pass", "Micro Point"]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "What amount of bits commonly equals one byte?",
    "correct_answer": "8",
    "incorrect_answers": ["1", "2", "64"]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question":
        "Which computer hardware device provides an interface for all other connected devices to communicate?",
    "correct_answer": "Motherboard",
    "incorrect_answers": [
      "Central Processing Unit",
      "Hard Disk Drive",
      "Random Access Memory"
    ]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "In web design, what does CSS stand for?",
    "correct_answer": "Cascading Style Sheet",
    "incorrect_answers": [
      "Counter Strike: Source",
      "Corrective Style Sheet",
      "Computer Style Sheet"
    ]
  } /*,
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "What is the code name for the mobile operating system Android 7.0?",
    "correct_answer": "Nougat",
    "incorrect_answers": [
      "Ice Cream Sandwich",
      "Jelly Bean",
      "Marshmallow"
    ]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "On Twitter, what is the character limit for a Tweet?",
    "correct_answer": "140",
    "incorrect_answers": [
      "120",
      "160",
      "100"
    ]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "Which computer language would you associate Django framework with?",
    "correct_answer": "Python",
    "incorrect_answers": [
      "C#",
      "C++",
      "Java"
    ]
  },
  {
    "category": "Science: Computers",
    "type": "boolean",
    "difficulty": "easy",
    "question": "The Windows 7 operating system has six main editions.",
    "correct_answer": "True",
    "incorrect_answers": [
      "False"
    ]
  },
  {
    "category": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "Which programming language shares its name with an island in Indonesia?",
    "correct_answer": "Java",
    "incorrect_answers": [
      "Python",
      "C",
      "Jakarta"
    ]
  }*/
]);

Future<List<Question>> createQuestions(Pokemon p) async {
  List<String> tipos = [
    'normal',
    'grass',
    'fire',
    'water',
    'electric',
    'ice',
    'fighting',
    'poison',
    'ground',
    'flying',
    'psychic',
    'bug',
    'rock',
    'ghost',
    'dragon',
    'dark',
    'steel',
    'fairy'
  ];

  List<String> copiaTipos =
      tipos.where((element) => element != p.types[0]).toList();
  if (p.types.length>1) {
    copiaTipos = copiaTipos.where((element) => element != p.types[1]).toList();
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  List<dynamic> abilities = p.abilities;

  var pokemonNumbers = new List<int>.generate(150, (i) => i+1);
  pokemonNumbers.remove(p.number);

  List<Pokemon> randomPokemon = [];

  for (int _ in List.generate(3, (index) => index)) {

    List<dynamic> ability;
    Pokemon poke;

    while (ability==null || abilities.contains(ability)) {
      var random = getRandomElement(pokemonNumbers);
      poke = await fetchPokemon("https://pokeapi.co/api/v2/pokemon/$random");
      ability = poke.abilities;
      pokemonNumbers.remove(random);
    }
    randomPokemon
        .add(poke);
  }

  List<String> preguntas = [
    "What type is this Pokemon?",
    "Which of this abilities does this pokemon have?",
    "What is the name of this Pokemon?",
    "Is it an evolved pokemon?",
    "Which of this movements does this pokemon have?"
  ];

  List<Map<String, dynamic>> data = [
    {
      "category": "Science: Computers",
      "type": "multiple",
      "difficulty": "easy",
      "question": preguntas[1],
      "correct_answer": p.abilities[0],
      "incorrect_answers": randomPokemon.map((p) => p.abilities[0]).toList()
    },
    {
      "category": "Science: Computers",
      "type": "multiple",
      "difficulty": "easy",
      "question": preguntas[2],
      "correct_answer": p.name,
      "incorrect_answers": randomPokemon.map((p) => p.name).toList()
    },
    {
      "category": "Science: Computers",
      "type": "multiple",
      "difficulty": "easy",
      "question": preguntas[0],
      "correct_answer": p.types[0],
      "incorrect_answers": [
        copiaTipos[Random().nextInt(5 - 0)],
        copiaTipos[Random().nextInt(10 - 5)],
        copiaTipos[Random().nextInt(15 - 10)],
      ]
    }
  ];

  return Question.fromData(data);
}
