import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

Future<Map<String, dynamic>> getUser() async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  Map<String, dynamic> map = {};
  var collection = db.collection('user');

  await collection.find().forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
    map['trainer'] = v['trainer'];
    map['captured'] = v['captured'];
  });
  await db.close();
  return map;
}

Future<String> getUserName() async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Obteniendo nombre de usuario');
  var collection = db.collection('user');

  Map<String, dynamic> map = {};
  await collection.find().forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
    map['trainer'] = v['trainer'];
  });
  await db.close();
  return map['name'];
}

Future<bool> updateUserName(String name) async {
  print("Ubuntu");
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Actualizando usuario');
  var collection = db.collection('user');

  collection.updateOne(where.eq('_id', 'usuario'), modify.set('name', name));

  await db.close();
  return true;
}

Future<bool> updateUserGender(String gender) async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Actualizando genero');
  var collection = db.collection('user');

  collection.updateOne(
      where.eq('_id', 'usuario'), modify.set('gender', gender));

  await db.close();
  return true;
}

Future<bool> updateUserBirthday(DateTime date) async {
  print("Ubuntu");
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Actualizando cumpleaños');
  var collection = db.collection('user');

  collection.updateOne(
      where.eq('_id', 'usuario'), modify.set('birthday', date));

  await db.close();
  return true;
}

Future<bool> updateUserTrainer(String trainer) async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('>> Guardando foto de perfil');
  print('====================================================================');
  var collection = db.collection('user');

  collection.updateOne(
      where.eq('_id', 'usuario'), modify.set('trainer', trainer));

  await db.close();
  return true;
}

updateFavPokemon(int fav) async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Actualizando Pokemon Favorito');
  var collection = db.collection('user');

  collection.updateOne(
      where.eq('_id', 'usuario'), modify.set('fav_pokemon', fav));

  await db.close();
}

Future<Map<String, dynamic>> getFavPokemonYEntrenador() async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  var collection = db.collection('user');

  Map<String, dynamic> map = {};
  await collection.find().forEach((v) {
    map['trainer'] = v['trainer'];
    map['fav_pokemon'] = v['fav_pokemon'];
  });
  await db.close();
  return map;
}

Future<List<dynamic>> getPokemonList() async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Oobteniendo lista de pokemon capturados');
  var collection = db.collection('user');
  var temp =
      await collection.findOne(where.eq("_id", 'usuario').fields(['captured']));
  var captured = temp['captured'];
  await db.close();
  return captured;
}

void addPokemon(int n) async {
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Añado pokemon a capturados');
  var collection = db.collection('user');

  Map<String, dynamic> map = {};
  await collection.find().forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
    map['captured'] = v['captured'];
  });

  if (!map['captured'].contains(n)) {
    map['captured'].add(n);
  }
  print(map['captured']);

  await collection.updateOne(
      where.eq('_id', 'usuario'), modify.set('captured', map['captured']));

  await db.close();
}
