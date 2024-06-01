import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HarmonyScreen extends StatelessWidget {
  final List<Map<String, String>> harmonyAudios = [
    {
      'title': 'Гармония 1',
      'url': 'https://www.example.com/path-to-your-audio-file9.mp3',
    },
    {
      'title': 'Гармония 2',
      'url': 'https://www.example.com/path-to-your-audio-file10.mp3',
    },
    // Добавьте больше аудио здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Гармония и баланс'),
      ),
      body: ListView.builder(
        itemCount: harmonyAudios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(harmonyAudios[index]['title']!),
              onTap: () async {
                final audioUrl = harmonyAudios[index]['url']!;
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
