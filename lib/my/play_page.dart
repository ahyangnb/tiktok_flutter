import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class PlayPage extends StatefulWidget {
  final String video;

  PlayPage(this.video);

  PlayPageState createState() => PlayPageState();
}

class PlayPageState extends State<PlayPage> {
  VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset(widget.video);
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
//        Navigator.pop(context);
        _videoPlayerController.play();
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController));
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}
