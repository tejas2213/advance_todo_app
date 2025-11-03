import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'TodoModel.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();

  static const String _dbName = 'TodoDB.db';
  static const int _dbVersion = 2; // bump for id column

  static const String tableTodo = 'Todo';

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTodo(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            date TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Migrate existing table without id to a new table with id
          await db.execute('''
            CREATE TABLE ${tableTodo}_new(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              description TEXT,
              date TEXT
            )
          ''');
          await db.execute('''
            INSERT INTO ${tableTodo}_new(title, description, date)
            SELECT title, description, date FROM $tableTodo
          ''');
          await db.execute('DROP TABLE IF EXISTS $tableTodo');
          await db.execute('ALTER TABLE ${tableTodo}_new RENAME TO $tableTodo');
        }
      },
    );
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableTodo, orderBy: 'id DESC');
    return maps.map((m) => TodoModel.fromMap(m)).toList();
    
  }

  Future<int> insertTodo(TodoModel todo) async {
    final db = await database;
    return await db.insert(tableTodo, todo.toMap()..remove('id'));
  }

  Future<int> updateTodo(TodoModel todo) async {
    final db = await database;
    return await db.update(
      tableTodo,
      todo.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      tableTodo,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
