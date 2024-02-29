import 'package:dart_features/custom_stream_builder.dart';
import 'package:dart_features/stream_generator.dart';
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
          title: const Text("Stream"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Stream using Async Generator"),
              StreamBuilder(
                stream: StreamGnerator().intStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Text("Error occured");
                  }

                  return Text(
                    "${snapshot.data ?? 0}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(height: 50),
              const CustomStreamBuilder(),
            ],
          ),
        ));
  }
}
