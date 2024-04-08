// Player Screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemChrome
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatelessWidget {
  final String videoUrl;

  PlayerScreen({required this.videoUrl}) {
    // Hide system UI (navigation and status bars) for TV platforms
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
            flags: YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}

class PlayerScreenRoute extends PageRoute<void> {
  final String videoUrl;

  PlayerScreenRoute({required this.videoUrl});

  @override
  // This is required to make the screen fullscreen on TV platforms
  bool get fullscreenDialog => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return PlayerScreen(videoUrl: videoUrl);
  }

  Widget buildPageNoAnimations(BuildContext context) {
    return PlayerScreen(videoUrl: videoUrl);
  }

  @override
  // We don't need transitions in this case, so we return an empty animation
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  String get debugLabel => '';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  Color? get barrierColor =>
      null; // You can return the color of the barrier, or null to use the default color.

  @override
  String? get barrierLabel =>
      null; // You can return a label for the barrier, or null if no label is needed.

  @override
  bool get maintainState =>
      true; // Set to true if you want to maintain the state of the previous route, false otherwise.
}
