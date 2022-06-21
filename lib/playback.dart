import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class PlaybackPage extends StatefulWidget{
  const PlaybackPage({Key? key,required this.playback_url}) : super(key:key);

  final String playback_url;

  @override
  State<PlaybackPage> createState() => _PlaybackPageState();
}

class _PlaybackPageState extends State<PlaybackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playback"),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          widget.playback_url,
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}