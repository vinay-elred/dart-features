import 'package:dart_features/stream_generator.dart';
import 'package:flutter/material.dart';

class CustomStreamBuilder extends StatefulWidget {
  const CustomStreamBuilder({super.key});

  @override
  State<CustomStreamBuilder> createState() => _CustomStreamBuilderState();
}

class _CustomStreamBuilderState extends State<CustomStreamBuilder> {
  final customStream = CustomStream();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Stream using Stream Controller"),
        StreamBuilder(
          initialData: customStream.currentValue,
          stream: customStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error occured");
            }

            return Text(
              "${snapshot.data ?? 0}",
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () {
            int val = customStream.currentValue + 1;
            customStream.add(val);
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () {
            customStream.addError("Error on Tap");
          },
          icon: const Icon(Icons.error),
        ),
      ],
    );
  }

  @override
  void dispose() {
    customStream.dispose();
    super.dispose();
  }
}
