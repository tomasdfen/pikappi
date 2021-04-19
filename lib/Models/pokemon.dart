import 'dart:convert';

import 'package:http/http.dart' as http;

enum Type {
  NORMAL,
  GRASS,
  FIRE,
  WATER,
  ELECTRIC,
  ICE,
  FIGHTING,
  POISON,
  GROUND,
  FLYING,
  PSYCHIC,
  BUG,
  ROCK,
  GHOST,
  DRAGON,
  DARK,
  STEEL,
  FAIRY
}

class Pokemon {
  String name;
  int number;
  List<dynamic> types;
  String sprite;
  String prettySprite;
  int hp;
  int atk;
  int def;
  int spAtk;
  int spDef;
  int spd;
  List<dynamic> abilities;

  String get getName => this.name;

  set setName(String name) => this.name = name;

  get getNumber => this.number;

  set setNumber(number) => this.number = number;

  get getTypes => this.types;

  set setTypes(types) => this.types = types;

  set setSprite(String sprite) => this.sprite = sprite;
  
  set setPrettySprite(String prettySprite) => this.prettySprite = prettySprite;

  get getSprite => this.sprite;

  get getPrettySprite => this.prettySprite;

  get getHp => this.hp;

  set setHp(hp) => this.hp = hp;

  get getAtk => this.atk;

  set setAtk(atk) => this.atk = atk;

  get getDef => this.def;

  set setDef(def) => this.def = def;

  get getSpAtk => this.spAtk;

  set setSpAtk(spAtk) => this.spAtk = spAtk;

  get getSpDef => this.spDef;

  set setSpDef(spDef) => this.spDef = spDef;

  get getSpd => this.spd;

  set setSpd(spd) => this.spd = spd;

  get getabilities => this.abilities;

  set setabilities(abilities) => this.abilities = abilities;

  Pokemon({
    this.name,
    this.number,
    this.types,
    this.sprite,
    this.prettySprite,
    this.hp,
    this.atk,
    this.def,
    this.spAtk,
    this.spDef,
    this.spd,
    this.abilities,
  });

  factory Pokemon.fromJson(dynamic data) {
    var pokemon = Pokemon(
      name: data["name"] as String,
      number: data["id"] as int,
      types: (data['types'].length == 2)
          ? [
              data['types'][0]["type"]["name"],
              data['types'][1]["type"]["name"],
            ] as List<dynamic>
          : [
              data['types'][0]["type"]["name"],
            ] as List<dynamic>,
      sprite: data["sprites"]['front_default'] as String,
      prettySprite:
          data["sprites"]["other"]['dream_world']['front_default'] as String,
      hp: data['stats'][0]['base_stat'] as int,
      atk: data['stats'][1]['base_stat'] as int,
      def: data['stats'][2]['base_stat'] as int,
      spAtk: data['stats'][3]['base_stat'] as int,
      spDef: data['stats'][4]['base_stat'] as int,
      spd: data['stats'][5]['base_stat'] as int,
      abilities: (data['abilities'].length == 3)
          ? [
              data['abilities'][0]['ability']['name'],
              data['abilities'][1]['ability']['name'],
              data['abilities'][2]['ability']['name']
            ] as List<dynamic>
          : (data['abilities'].length == 2)
              ? [
                  data['abilities'][0]['ability']['name'],
                  data['abilities'][1]['ability']['name'],
                ] as List<dynamic>
              : [
                  data['abilities'][0]['ability']['name'],
                ] as List<dynamic>,
    );
    return pokemon;
  }
}

Future<Pokemon> fetchPokemon(String url) async {
  final response = await http.get(Uri.parse(url));
  return parsePokemon(response.body);
}

Pokemon parsePokemon(String responsebody) {
  final parsed = jsonDecode(responsebody);
  return Pokemon.fromJson(parsed);
}

List<Future<Pokemon>> fetchPokemonList(int start, int end) {
  List<Future<Pokemon>> p;
  for (var i = start; i < end + 1; i++) {
    String url = "https://pokeapi.co/api/v2/pokemon/${i}/";
    p.add(fetchPokemon(url));
  }
  return p;
}
