import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counterbloc_cubit.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App",style: TextStyle(color: Color(0xFFDE0089)),)),
      body: BlocConsumer<CounterCubit, int>(
        listener: (context, counter) {
          if (counter < 0) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('error'),
                content: Text('Counter is negative!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } else if (counter == 10 || counter == -10) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Counter reached $counter!'),
              ),
            );
          }
        },
        builder: (context, counter) {
          return Center(
            child: Text(
              'Counter: $counter',
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
