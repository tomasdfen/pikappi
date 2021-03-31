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

  Pokemon(
      String _name,
      int _number,
      List<String> _types,
      int _hp,
      int _atk,
      int _def,
      int _spAtk,
      int _spDef,
      int _spd,
      List<String> _abilities,
      ) {
    name = _name;
    number = _number;
    types = _types;
    hp = _hp;
    atk = _atk;
    def = _def;
    spAtk = _spAtk;
    spDef = _spDef;
    spd = _spd;
    abilities = _abilities;
  }

  Future<Pokemon> create(url) async {
    final res = await http.get(url);
    final jsonData = json.decode(res.body);
    Map<String, dynamic> data = jsonDecode(jsonData);
    var _name = data["name"];
    var _number = data["id"];
    var _types = [
      data['types'][0]["type"]["name"],
      data['types'][1]["type"]["name"]
    ];
    var _hp = data['stats'][0]['base_stat'];
    var _atk = data['stats'][1]['base_stat'];
    var _def = data['stats'][2]['base_stat'];
    var _spAtk = data['stats'][3]['base_stat'];
    var _spDef = data['stats'][4]['base_stat'];
    var _spd = data['stats'][5]['base_stat'];
    var _abilities = [
      data['abilities'][0]['ability']['name'],
      data['abilities'][1]['ability']['name']
    ];
    return new Pokemon(
        _name, _number, _types, _hp, _atk, _def, _spAtk, _spDef, _spd, _abilities);
  }
}