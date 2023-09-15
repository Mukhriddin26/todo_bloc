import 'dart:math';

import 'package:flutter/material.dart';

class AudioInfo extends StatefulWidget {
  const AudioInfo({super.key});

  @override
  State<AudioInfo> createState() => _AudioInfoState();
}

class _AudioInfoState extends State<AudioInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween<double>(begin: 0, end: 4 * pi).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Align(
              //alignment: Alignment(animation.value / (2 * pi) - 1, 0),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(animation.value),
                child: const Icon(
                  Icons.sports_basketball,
                  size: 100,
                  color: Colors.orange,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
        const Text(
          'Miriam Makeba',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        const Text(
          'Jain',
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
