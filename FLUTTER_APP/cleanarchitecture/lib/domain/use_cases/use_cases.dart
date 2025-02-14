import 'package:cleanarchitecture/domain/entities/entity.dart';
import 'package:cleanarchitecture/domain/repositories/repository.dart';

class FetchTasksUseCase {
  final TaskRepository repository;

  FetchTasksUseCase(this.repository);

  Future<List<Task>> call() {
    return repository.fetchTasks();
  }
}
