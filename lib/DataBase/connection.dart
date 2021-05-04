import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void getUser() async {
  var db = await Db.create("mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  await db.open();  // Example url for Atlas connection
  /* var db = Db('mongodb://<atlas-user>:<atlas-password>@'
      'cluster0-shard-00-02.xtest.mongodb.net:27017,'
      'cluster0-shard-00-01.xtest.mongodb.net:27017,'
      'cluster0-shard-00-00.xtest.mongodb.net:27017/'
      'mongo_dart-blog?authSource=admin&compressors=disabled'
      '&gssapiServiceName=mongodb&replicaSet=atlas-stcn2i-shard-0'
      '&ssl=true'); */
  print('====================================================================');
  print('>> Adding Authors');
  Map<String, dynamic> map = {};
  var collection = db.collection('user');
  await collection.find({'id': 'usuario'}).forEach((v) {
    map['_id'] = v['_id'];
    map['image'] = v['image'];
    map['name'] = v['name'];
    map['gender'] = v['gender'];
    map['birthday'] = v['birthday'];
    map['fav_pokemon'] = v['fav_pokemon'];
  });
  await db.close();
  print(map);
}