import 'package:flutter/material.dart';
import 'package:flutterdevstv/video_player_route.dart';
import 'package:flutterdevstv/video_list_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Your theme configuration
          ),
      // Launch directly into VideoListScreen
      initialRoute: '/',
      routes: {
        '/': (context) => VideoListScreen(),
        // Define the route for PlayerScreenRoute with the videoUrl argument
        '/player': (context) {
          final String? videoUrl =
              ModalRoute.of(context)?.settings.arguments as String?;
          return PlayerScreenRoute(videoUrl: videoUrl!)
              .buildPageNoAnimations(context);
          // videoUrl:
          //     videoUrl ?? ''); // Pass an empty string if videoUrl is null
        },
      },
    );
  }
}
