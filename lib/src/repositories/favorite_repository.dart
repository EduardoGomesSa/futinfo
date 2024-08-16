import 'dart:async';
import 'package:futinfo/src/repositories/databases/db.dart';
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

  Future<int> remove(int idTeam) async {
    final db = await Db.connection();

    final deleted = await db
        .delete('favorite_teams', where: 'id_team = ?', whereArgs: [idTeam]);

    return deleted;
  }

  Future<int> getById(int idTeam) async {
    final db = await Db.connection();

    final result = await db.query(
      'favorite_teams',
      columns: ['id_team'],
      where: 'id_team = ?',
      whereArgs: [idTeam],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first['id_team'] as int;
    }

    return 0;
  }
}
