import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        correo TEXT NOT NULL UNIQUE,
        contrasena TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE materiales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
        costo_unitario REAL NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE instalaciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cliente_nombre TEXT NOT NULL,
        cliente_telefono TEXT NOT NULL,
        cliente_direccion TEXT NOT NULL,
        descripcion TEXT NOT NULL,
        fecha TEXT NOT NULL,
        monto_cobrado REAL NOT NULL,
        estado TEXT NOT NULL DEFAULT 'pendiente',
        observaciones TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE instalacion_materiales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        instalacion_id INTEGER NOT NULL,
        material_id INTEGER NOT NULL,
        cantidad_usada INTEGER NOT NULL,
        costo_unitario REAL NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE fotos_instalacion (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        instalacion_id INTEGER NOT NULL,
        ruta TEXT NOT NULL
      )
    ''');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('camsec_local.db');
    return _database!;
  }

}