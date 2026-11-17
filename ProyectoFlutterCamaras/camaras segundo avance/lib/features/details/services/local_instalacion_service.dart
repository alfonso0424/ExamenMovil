import '../models/instalacion_model.dart';
import '../../../core/database/database_helper.dart';

class LocalInstalacionService {

  final dbHelper = DatabaseHelper.instance;

  Future<int> insertInstalacion(InstalacionModel instalacion) async {
    final db = await dbHelper.database;
    return await db.insert('instalaciones', instalacion.toMap());
  }

}