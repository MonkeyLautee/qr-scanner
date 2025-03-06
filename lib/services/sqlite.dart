import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLite {

  static late final Database sql;
  static Future<void> initSQL()async{
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    sql = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Data (id INTEGER PRIMARY KEY, string TEXT, lastModified INTEGER)');
      },
    );
  }

  static Future<List<Map<String,dynamic>>> getAllData()async{
    return await sql.rawQuery('SELECT * FROM Data');
  }

  static Future<int> createData(String string,{DateTime? creationDate})async{
    final int id = await sql.rawInsert(
      'INSERT INTO Data (string, lastModified) VALUES (?,?)',
      [string, creationDate??DateTime.now().millisecondsSinceEpoch],
    );
    return id;
  }

  static Future<void> updateData(int id, String string)async{
    await sql.rawUpdate(
      'UPDATE Data SET string = ?, lastModified = ? WHERE id = ?',
      [string,DateTime.now().millisecondsSinceEpoch,id],
    );
  }

  static Future<Map<String,dynamic>?> getData(int id)async{
    List<Map<String,dynamic>>? query = await sql.rawQuery(
      'SELECT * FROM Notes WHERE id = ?',
      [id],
    );
    return query.isEmpty?null:query.first;
  }

  static Future<void> deleteNote(int id)async{
    await sql.rawDelete('DELETE FROM Notes WHERE id = ?',[id]);
  }

}