import 'package:appdemo/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomevideoIntro extends StatefulWidget {
  const HomevideoIntro({super.key});

  @override
  State<HomevideoIntro> createState() => _HomevideoIntroState();
}

class _HomevideoIntroState extends State<HomevideoIntro> {
  late VideoPlayerController _controller;
  bool isVideoEnded = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/video_accueil.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration &&
          !isVideoEnded) {
        setState(() {
          isVideoEnded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? SizedBox.expand(child: VideoPlayer(_controller))
            : const Center(child: CircularProgressIndicator()),
        if (isVideoEnded)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Entrer dans la boutique"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainPage()),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
