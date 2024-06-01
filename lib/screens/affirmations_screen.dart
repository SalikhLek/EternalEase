import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AffirmationsScreen extends StatelessWidget {
  final List<Map<String, String>> affirmations = [
    {
      'title': 'Аффирмация 1',
      'url': 'https://www.example.com/path-to-your-audio-file1.mp3',
    },
    {
      'title': 'Аффирмация 2',
      'url': 'https://www.example.com/path-to-your-audio-file2.mp3',
    },
    // Добавьте больше аффирмаций здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Аффирмации'),
      ),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(affirmations[index]['title']!),
              onTap: () async {
                final audioUrl = affirmations[index]['url']!;
                AudioPlayer audioPlayer = AudioPlayer();
                await audioPlayer.play(audioUrl);
              },
            ),
          );
        },
      ),
    );
  }
}
