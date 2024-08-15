import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

abstract class Db {
  static Future<sql.Database> connection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'futinfo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE favorite_teams(ID INTEGER PRIMARY KEY, id_team INTEGER)');
      },
      version: 1,
    );
  }
}
