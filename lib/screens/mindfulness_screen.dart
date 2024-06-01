import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MindfulnessScreen extends StatelessWidget {
  final List<Map<String, String>> mindfulnessAudios = [
    {
      'title': 'Осознанность 1',
      'url': 'https://www.example.com/path-to-your-audio-file7.mp3',
    },
    {
      'title': 'Осознанность 2',
      'url': 'https://www.example.com/path-to-your-audio-file8.mp3',
    },
    // Добавьте больше аудио здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Развитие осознанности'),
      ),
      body: ListView.builder(
        itemCount: mindfulnessAudios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(mindfulnessAudios[index]['title']!),
              onTap: () async {
                final audioUrl = mindfulnessAudios[index]['url']!;
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
