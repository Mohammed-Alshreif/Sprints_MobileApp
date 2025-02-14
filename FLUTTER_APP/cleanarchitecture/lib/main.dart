import 'package:cleanarchitecture/presentation/pages/page1.dart';
import 'package:flutter/material.dart';
import 'di/injection.dart' as di;

void main() {
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Demo',
      home: TaskPage(),
    );
  }
}
