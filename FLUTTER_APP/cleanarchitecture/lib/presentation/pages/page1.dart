import 'package:cleanarchitecture/presentation/viewmodels/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/view.dart';
import '../../di/injection.dart'; 

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mohammed adle alshreif")),
      body: ChangeNotifierProvider<TaskViewModel>(
        create: (_) => sl<TaskViewModel>()..loadTasks(),
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.tasks.isEmpty) {
              return const Center(child: Text("No tasks available."));
            }
            return ListView.builder(
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                return ListTile(
                  title: Text(task.title),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
