import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, int> pokemonIds = {
  "Bulbasaur": 1,
  "Ivysaur": 2,
  "Venusaur": 3,
  "Charmander": 4,
  "Charmeleon": 5,
  "Charizard": 6,
  "Squirtle": 7,
  "Wartortle": 8,
  "Blastoise": 9,
  "Caterpie": 10,
  "Metapod": 11,
  "Butterfree": 12,
  "Weedle": 13,
  "Kakuna": 14,
  "Beedrill": 15,
  "Pidgey": 16,
  "Pidgeotto": 17,
  "Pidgeot": 18,
  "Rattata": 19,
  "Raticate": 20,
  "Spearow": 21,
  "Fearow": 22,
  "Ekans": 23,
  "Arbok": 24,
  "Pikachu": 25,
  "Raichu": 26,
  "Sandshrew": 27,
  "Sandslash": 28,
  "Nidoran♀": 29,
  "Nidorina": 30,
  "Nidoqueen": 31,
  "Nidoran♂": 32,
  "Nidorino": 33,
  "Nidoking": 34,
  "Clefairy": 35,
  "Clefable": 36,
  "Vulpix": 37,
  "Ninetales": 38,
  "Jigglypuff": 39,
  "Wigglytuff": 40,
  "Zubat": 41,
  "Golbat": 42,
  "Oddish": 43,
  "Gloom": 44,
  "Vileplume": 45,
  "Paras": 46,
  "Parasect": 47,
  "Venonat": 48,
  "Venomoth": 49,
  "Diglett": 50,
  "Dugtrio": 51,
  "Meowth": 52,
  "Persian": 53,
  "Psyduck": 54,
  "Golduck": 55,
  "Mankey": 56,
  "Primeape": 57,
  "Growlithe": 58,
  "Arcanine": 59,
  "Poliwag": 60,
  "Poliwhirl": 61,
  "Poliwrath": 62,
  "Abra": 63,
  "Kadabra": 64,
  "Alakazam": 65,
  "Machop": 66,
  "Machoke": 67,
  "Machamp": 68,
  "Bellsprout": 69,
  "Weepinbell": 70,
  "Victreebel": 71,
  "Tentacool": 72,
  "Tentacruel": 73,
  "Geodude": 74,
  "Graveler": 75,
  "Golem": 76,
  "Ponyta": 77,
  "Rapidash": 78,
  "Slowpoke": 79,
  "Slowbro": 80,
  "Magnemite": 81,
  "Magneton": 82,
  "Farfetch’d": 83,
  "Doduo": 84,
  "Dodrio": 85,
  "Seel": 86,
  "Dewgong": 87,
  "Grimer": 88,
  "Muk": 89,
  "Shellder": 90,
  "Cloyster": 91,
  "Gastly": 92,
  "Haunter": 93,
  "Gengar": 94,
  "Onix": 95,
  "Drowzee": 96,
  "Hypno": 97,
  "Krabby": 98,
  "Kingler": 99,
  "Voltorb": 100,
  "Electrode": 101,
  "Exeggcute": 102,
  "Exeggutor": 103,
  "Cubone": 104,
  "Marowak": 105,
  "Hitmonlee": 106,
  "Hitmonchan": 107,
  "Lickitung": 108,
  "Koffing": 109,
  "Weezing": 110,
  "Rhyhorn": 111,
  "Rhydon": 112,
  "Chansey": 113,
  "Tangela": 114,
  "Kangaskhan": 115,
  "Horsea": 116,
  "Seadra": 117,
  "Goldeen": 118,
  "Seaking": 119,
  "Staryu": 120,
  "Starmie": 121,
  "Mr. Mime": 122,
  "Scyther": 123,
  "Jynx": 124,
  "Electabuzz": 125,
  "Magmar": 126,
  "Pinsir": 127,
  "Tauros": 128,
  "Magikarp": 129,
  "Gyarados": 130,
  "Lapras": 131,
  "Ditto": 132,
  "Eevee": 133,
  "Vaporeon": 134,
  "Jolteon": 135,
  "Flareon": 136,
  "Porygon": 137,
  "Omanyte": 138,
  "Omastar": 139,
  "Kabuto": 140,
  "Kabutops": 141,
  "Aerodactyl": 142,
  "Snorlax": 143,
  "Articuno": 144,
  "Zapdos": 145,
  "Moltres": 146,
  "Dratini": 147,
  "Dragonair": 148,
  "Dragonite": 149,
  "Mewtwo": 150,
  "Mew": 151
};

Color getTypeColor(String type) {
  switch (type) {
    case "fire":
      {
        return Colors.amber[900];
      }
      break;
    case "grass":
      {
        return Colors.green;
      }
      break;
    case "water":
      {
        return Colors.blue;
      }
      break;
    case "bug":
      {
        return Colors.lightGreen;
      }
      break;
    case "flying":
      {
        return Colors.lightBlue[100];
      }
      break;
    case "poison":
      {
        return Colors.purple;
      }
      break;
    case "rock":
      {
        return Colors.grey[800];
      }
      break;
    case "steel":
      {
        return Colors.grey;
      }
      break;
    case "ice":
      {
        return Colors.blueAccent[100];
      }
      break;
    case "ground":
      {
        return Colors.brown[400];
      }
      break;
    case "dragon":
      {
        return Colors.blue[900];
      }
      break;
    case "dark":
      {
        return Colors.black87;
      }
      break;
    case "ghost":
      {
        return Colors.grey[850];
      }
      break;
    case "fairy":
      {
        return Colors.pinkAccent;
      }
      break;
    case "psychic":
      {
        return Colors.pink;
      }
      break;
    case "electric":
      {
        return Colors.yellow;
      }
      break;
    case "fighting":
      {
        return Colors.amber;
      }
      break;

    default:
      {
        return Colors.white;
      }
      break;
  }
}

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
