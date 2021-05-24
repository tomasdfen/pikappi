import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

Future<Map<String, dynamic>> getUser() async {
  print("Ubuntu");
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Adding Authors');
  Map<String, dynamic> map = {};
  var collection = db.collection('user');

  await collection.find().forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
  });
  await db.close();
  return map;
}

Future<String> getUserName() async {
  print("Ubuntu");
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Adding Authors');
  var collection = db.collection('user');

  Map<String, dynamic> map = {};
  await collection.find().forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
  });
  await db.close();
  return map['name'];
}

Future<String> updateUserGender(String gender) async {
  print("Ubuntu");
  var db = await Db.create(
      "mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();
  print('====================================================================');
  print('>> Updating User');
  var collection = db.collection('user');

  collection.updateOne(where.eq('_id', 'usuario'), modify.set('gender', gender));

  await db.close();
  return "Changed gender to " + gender;
}