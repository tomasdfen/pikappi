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
  List<String> types;
  String sprite;
  int hp;
  int atk;
  int def;
  int spAtk;
  int spDef;
  int spd;
  List<String> abilities;

  String get getName => this.name;

  set setName(String name) => this.name = name;

  get getNumber => this.number;

  set setNumber(number) => this.number = number;

  get getTypes => this.types;

  set setTypes(types) => this.types = types;

  set setSprite(String sprite) => this.sprite = sprite;

  get getSprite => this.sprite;

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
    this.hp,
    this.atk,
    this.def,
    this.spAtk,
    this.spDef,
    this.spd,
    this.abilities,
  });

  factory Pokemon.fromJson(dynamic data) {
    return Pokemon(
        name: data["name"] as String,
        number: data["id"] as int,
        types: [
          data['types'][0]["type"]["name"],
          data['types'][1]["type"]["name"],
        ] as List<String>,
        sprite: data["sprites"]["front_default"] as String,
        hp: data['stats'][0]['base_stat'] as int,
        atk: data['stats'][1]['base_stat'] as int,
        def: data['stats'][2]['base_stat'] as int,
        spAtk: data['stats'][3]['base_stat'] as int,
        spDef: data['stats'][4]['base_stat'] as int,
        spd: data['stats'][5]['base_stat'] as int,
        abilities: [
          data['abilities'][0]['ability']['name'],
          data['abilities'][1]['ability']['name']
        ] as List<String>);
  }
}

List<Pokemon> parsePokemon(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
}

Future<List<Pokemon>> fetchPokemon() async {
  final response = await http
      .get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"));
  return parsePokemon(response.body);
}
