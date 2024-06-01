import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SleepScreen extends StatelessWidget {
  final List<Map<String, String>> sleepAudios = [
    {
      'title': 'Улучшение сна 1',
      'url': 'https://www.example.com/path-to-your-audio-file11.mp3',
    },
    {
      'title': 'Улучшение сна 2',
      'url': 'https://www.example.com/path-to-your-audio-file12.mp3',
    },
    // Добавьте больше аудио здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Улучшение сна'),
      ),
      body: ListView.builder(
        itemCount: sleepAudios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(sleepAudios[index]['title']!),
              onTap: () async {
                final audioUrl = sleepAudios[index]['url']!;
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
