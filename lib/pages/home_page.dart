import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_todo/service/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;
  late AnimationController controller;
  late Animation<double> animation;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 100));
    animation = Tween<double>(begin: 0, end: 8 * (2*pi)).animate(controller);
    initPlayer();
   // controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> initPlayer() async   {
    player = AudioPlayer();
    path = AssetSource('audios/makeba.mp3');

    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  Future<void> playPause() async {
    if (isPlaying) {
      player.pause();

      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Align(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(animation.value),
                        child: ClipOval(
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/img.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
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
            ),
            const SizedBox(height: 50),
            Slider(
              value: _position.inSeconds.toDouble(),
              onChanged: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
                setState(() {});
              },
              min: 0,
              max: _duration.inSeconds.toDouble(),
              inactiveColor: Colors.grey,
              activeColor: isPlaying ? Colors.blue : Colors.red,
            ),

            /// player position and end
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_position.format()),
                  Text(_duration.format()),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds - 10));
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.replay,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    playPause();
                    if(isPlaying){
                      controller.forward();
                    }else{
                      controller.stop();
                    }


                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: isPlaying ? Colors.red : Colors.blue,
                    size: 100,
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds + 10));
                    setState(() {});
                  },
                  child: Transform.flip(
                      flipX: true,
                      child: const Icon(
                        Icons.replay,
                        size: 70,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
