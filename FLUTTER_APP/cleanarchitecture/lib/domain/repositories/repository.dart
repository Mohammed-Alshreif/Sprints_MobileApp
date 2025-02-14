import 'package:cleanarchitecture/domain/entities/entity.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
}
