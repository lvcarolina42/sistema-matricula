import 'package:sqflite_common/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Db {
  Database? _db;
  static Db? _instance;

  Database? get database => _db;

  Db._internal() {
    // Chamada direta ao init para garantir que o banco seja inicializado
    init();
  }

  factory Db() {
    _instance ??= Db._internal();
    return _instance!;
  }

  Future<void> init() async {
    try {
      sqfliteFfiInit();

      var databaseFactory = databaseFactoryFfi;
      final dataBasePath = await getApplicationDocumentsDirectory();

      _db = await databaseFactory.openDatabase(
        '${dataBasePath.path}/sistema_matricula.db',
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await createTables();
          },
        ),
      );

      if (_db != null) {
        await createTables();
      }
    } catch (e) {
      print("Error initializing the database: $e");
    }
  }

  Future<void> createTables() async {
    try {
      await _db!.execute('''
      CREATE TABLE IF NOT EXISTS student (
          id INTEGER PRIMARY KEY,
          cpf TEXT,
          name TEXT,
          password TEXT,
          period INTEGER,
          courseId INTEGER
      );

      CREATE TABLE IF NOT EXISTS teacher (
          id INTEGER PRIMARY KEY,
          cpf TEXT,
          name TEXT,
          password TEXT,
          subjectId INTEGER
      );

      CREATE TABLE IF NOT EXISTS secretary (
          id INTEGER PRIMARY KEY,
          cpf TEXT,
          name TEXT,
          password TEXT
      );

      CREATE TABLE IF NOT EXISTS course (
          id INTEGER PRIMARY KEY,
          code INTEGER,
          name TEXT,
          credits INTEGER,
          periods INTEGER
      );

      CREATE TABLE IF NOT EXISTS subject (
          id INTEGER PRIMARY KEY,
          code INTEGER,
          name TEXT,
          credits INTEGER,
          periods INTEGER,
          courseId INTEGER,
          isOptional BOOLEAN,
          price DOUBLE
      );
<<<<<<< Updated upstream
=======

      CREATE TABLE IF NOT EXISTS registration (
          id INTEGER PRIMARY KEY,
          studentId INTEGER,
          subjectId INTEGER,
          courseId INTEGER
      );

      CREATE TABLE IF NOT EXISTS boleto (
          id INTEGER PRIMARY KEY,
          price DOUBLE,
          studentId INTEGER
      );
      
>>>>>>> Stashed changes
      ''');
    } catch (e) {
      print("Error creating tables: $e");
    }
  }
}
