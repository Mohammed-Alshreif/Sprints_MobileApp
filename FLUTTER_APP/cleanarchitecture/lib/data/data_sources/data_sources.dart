import 'package:cleanarchitecture/data/models/models.dart';

class TaskRemoteDataSource {
  Future<List<TaskModel>> fetchTasksFromApi() async {
    // Mocking API response
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      TaskModel(id: 1, title: "Task 1"),
      TaskModel(id: 2, title: "Task 2"),
    ];
  }
}
