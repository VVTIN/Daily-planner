import 'package:flutter_application_1/model/db_model/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper.internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "daily_planner.db");
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE tasks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT ,
    host TEXT,
    content TEXT,
    approver TEXT,
    date TEXT,
    status TEXT,
    startTime TEXT,
    endTime TEXT,
    remind TEXT)''');
  }

  Future<List<Task>> getAllTasks() async {
    final db = await instance.database;
    final result = await db.query('tasks');
    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> addTask(Task task) async {
    final db = await instance.database;
    return db.insert('tasks', task.toJson());
  }

  Future<int> updateTask(Task task) async {
    final db = await instance.database;
    return db.update(
      'tasks',
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
