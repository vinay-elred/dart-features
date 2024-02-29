import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extension"),
      ),
      body: Column(
        children: [
          Text('45'.parseInt.toString()),
          const SizedBox(height: 20),
          Text("Height ${context.height}"),
          Text("Width ${context.width}"),
          const SizedBox(height: 20),
        ],
      ).center,
    );
  }
}

extension StringExt on String {
  int? get parseInt {
    return int.tryParse(this);
  }
}

extension ContextExt on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension WidgetExt on Widget {
  Widget get center {
    return Center(child: this);
  }
}
