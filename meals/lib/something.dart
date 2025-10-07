import 'package:flutter/material.dart';

class Something extends StatefulWidget {
  const Something({super.key});

  @override
  State<Something> createState() => _SomethingState();
}

class _SomethingState extends State<Something> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            actions: const [
                Column(
                    children: [
                        Row(
                            children: [
                                Text('Hey Row'),
                            ],
                        )
                    ],
                )
            ],
        ),
    );
  }
}