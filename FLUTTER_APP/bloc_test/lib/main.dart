import 'package:bloc_test/Cupets/test/test_cubit.dart';
import 'package:bloc_test/Cupets/test/them_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.theme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: BlocProvider(
              create: (context) => CounterBloc(),
              child: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc test"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_2),
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeEvent());
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Center(
            child: BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counter == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Counter reached 5!')),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  'Counter: ${state.counter}',
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
