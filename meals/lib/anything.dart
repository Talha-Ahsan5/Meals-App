import 'package:flutter/material.dart';

class Anything extends StatefulWidget {
  const Anything({super.key});

  @override
  State<Anything> createState() => _AnythingState();
}

class _AnythingState extends State<Anything> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Column(
            children: [
              Text('hey'),
              Text('Hey untracked file!!'),
            ],
          )
        ],
      ),
    );
  }
}