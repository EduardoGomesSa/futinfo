import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/repositories/databases/db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepository {
  Future<int> insert(int idTeam) async {
    final db = await Db.connection();

    var saved = await db.insert('favorite_teams', {'id_team': idTeam},
        conflictAlgorithm: ConflictAlgorithm.replace);

    return saved;
  }

  Future<List<int>> getAllId() async {
    final db = await Db.connection();

    final result = await db.query('favorite_teams');

    List<int> ids = result.map((row) {
      return row['id_team'] as int;
    }).toList();

    return ids;
  }
}
