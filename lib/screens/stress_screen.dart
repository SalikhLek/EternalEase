import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class StressScreen extends StatelessWidget {
  final List<Map<String, String>> stressAudios = [
    {
      'title': 'Снятие стресса 1',
      'url': 'https://www.example.com/path-to-your-audio-file5.mp3',
    },
    {
      'title': 'Снятие стресса 2',
      'url': 'https://www.example.com/path-to-your-audio-file6.mp3',
    },
    // Добавьте больше аудио здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Снятие стресса и беспокойства'),
      ),
      body: ListView.builder(
        itemCount: stressAudios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(stressAudios[index]['title']!),
              onTap: () async {
                final audioUrl = stressAudios[index]['url']!;
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
