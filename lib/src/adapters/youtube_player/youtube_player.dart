import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerAdapter extends StatefulWidget {
  const YoutubePlayerAdapter({
    required this.videoId,
    this.autoPlay = false,
    this.useNoCookie = true,
    super.key,
  });

  final String videoId;
  final bool autoPlay;
  final bool useNoCookie;

  @override
  State<YoutubePlayerAdapter> createState() => _YoutubePlayerAdapterState();

  /// Shortcut to open the player in a new page
  static Future<void> open(
    BuildContext context,
    String videoId, {
    bool autoPlay = false,
    bool useNoCookie = true,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => YoutubePlayerAdapter(
          videoId: videoId,
          autoPlay: autoPlay,
          useNoCookie: useNoCookie,
        ),
      ),
    );
  }
}

class _YoutubePlayerAdapterState extends State<YoutubePlayerAdapter> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: AspectRatio(aspectRatio: 16 / 9, child: player),
            ),
          ),
        );
      },
    );
  }
}
