import 'package:flutter/material.dart';
import 'package:flutterdevstv/video_player_route.dart';

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Intro to Flutter',
      'url': 'https://www.youtube.com/watch?v=Kj6jwKsVC3A'
    },
    {
      'title': 'Flutter Widgets',
      'url': 'https://www.youtube.com/watch?v=1ukSR1GRtMU'
    },
    {
      'title': 'Life Cycle of a Widget',
      'url': 'https://www.youtube.com/watch?v=cyFM2emjbQ8'
    },
    {
      'title': 'BlocProvider and RepositoryProvider',
      'url': 'https://www.youtube.com/watch?v=jWN5oQXKhWU'
    },
    // Add more videos as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video List')),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videos[index]['title']!),
            onTap: () {
              Navigator.pushNamed(context, '/player',
                  arguments: videos[index]['url']);
            },
          );
        },
      ),
    );
  }
}
