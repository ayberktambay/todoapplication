
import 'package:todo/database/db_helper.dart';
import 'package:todo/models/todoModel.dart';

class TodoRepository {
  final dbHelper = DBHelper.dbHero;
Future<int> insert(ListModel todo) async {
    return await dbHelper.insertDb(todo.toMap());
  }
  Future<List<ListModel>> getAllTodos() async {
    final List<Map<String, dynamic>> maps = await dbHelper.readDb();
    return List.generate(maps.length, (i) {
      return ListModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
      );
    });
  }
  Future<int> update(ListModel todo) async {
    return await dbHelper.updateDb(todo.toMap());
  }
  Future<int> delete(int id) async {
    return await dbHelper.deleteDb(id);
  }
}