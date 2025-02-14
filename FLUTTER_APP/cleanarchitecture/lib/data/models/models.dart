import 'package:cleanarchitecture/domain/entities/entity.dart';

class TaskModel extends Task {
  TaskModel({required int id, required String title})
      : super(id: id, title: title);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
