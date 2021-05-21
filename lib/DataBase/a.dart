import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

void main() async {
  var db = await Db.create("mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net/pikappi");
  var authors = <String, Map>{};
  var users = <String, Map>{};
  await db.open();
  print('====================================================================');
  print('>> Adding Authors');
  var collection = db.collection('user');
  await collection.find().forEach((v) {
    print(v);
  });
  await db.close();
}


