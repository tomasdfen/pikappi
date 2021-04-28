import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

String host = Platform.environment['mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net'] ?? 'mongodb+srv://admin:tfgadmin@cluster0.cjbui.mongodb.net';
String port = Platform.environment['27017'] ?? '27017';

void main() async {
  var db = Db.pool(["mongodb://admin:tfgadmin@cluster0.cjbui.mongodb.net:27017/user?authSource=admin"]);
  // Example url for Atlas connection
  /* var db = Db('mongodb://<atlas-user>:<atlas-password>@'
      'cluster0-shard-00-02.xtest.mongodb.net:27017,'
      'cluster0-shard-00-01.xtest.mongodb.net:27017,'
      'cluster0-shard-00-00.xtest.mongodb.net:27017/'
      'mongo_dart-blog?authSource=admin&compressors=disabled'
      '&gssapiServiceName=mongodb&replicaSet=atlas-stcn2i-shard-0'
      '&ssl=true'); */
  var authors = <String, Map>{};
  var users = <String, Map>{};
  await db.open(secure: true);
  await db.drop();
  print('====================================================================');
  print('>> Adding Authors');
  var collection = db.collection('user');
  await collection.find().forEach((v) {
    print(v);
  });
  await db.close();
}