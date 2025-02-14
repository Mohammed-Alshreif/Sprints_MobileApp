import 'package:cleanarchitecture/data/data_sources/data_sources.dart';
import 'package:cleanarchitecture/domain/entities/entity.dart';
import 'package:cleanarchitecture/domain/repositories/repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<Task>> fetchTasks() async {
    return await dataSource.fetchTasksFromApi();
  }
}
