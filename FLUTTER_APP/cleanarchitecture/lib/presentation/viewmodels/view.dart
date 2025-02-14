import 'package:cleanarchitecture/domain/entities/entity.dart';
import 'package:cleanarchitecture/domain/use_cases/use_cases.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  final FetchTasksUseCase fetchTasksUseCase;

  TaskViewModel(this.fetchTasksUseCase);

  List<Task> tasks = [];
  bool isLoading = false;

  Future<void> loadTasks() async {
    isLoading = true;
    notifyListeners();

    tasks = await fetchTasksUseCase();
    isLoading = false;
    notifyListeners();
  }
}
