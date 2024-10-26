// lib/main.dart
import 'package:flutter/material.dart';
import 'view/video_player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(
        videoUrl: 'assets/videos/video1.mp4',
      ),
    );
  }
}
