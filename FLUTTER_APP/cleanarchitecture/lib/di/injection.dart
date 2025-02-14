import 'package:cleanarchitecture/data/data_sources/data_sources.dart';
import 'package:cleanarchitecture/data/repositories/repositories.dart';
import 'package:cleanarchitecture/domain/repositories/repository.dart';
import 'package:cleanarchitecture/domain/use_cases/use_cases.dart';
import 'package:cleanarchitecture/presentation/viewmodels/view.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  // Data sources
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSource());

  // Repositories
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(sl<TaskRemoteDataSource>()));

  // Use cases
  sl.registerLazySingleton(() => FetchTasksUseCase(sl<TaskRepository>()));

  // ViewModels
  sl.registerFactory(() => TaskViewModel(sl<FetchTasksUseCase>()));
}
