import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AffirmationsScreen extends StatelessWidget {
  final List<Map<String, String>> affirmations = [
    {
      'title': 'Аффирмация 1',
      'path': 'assets/audio/affirmation1.mp3',
    },
    {
      'title': 'Аффирмация 2',
      'path': 'assets/audio/affirmation2.mp3',
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
                final audioPath = affirmations[index]['path']!;
                AudioPlayer audioPlayer = AudioPlayer();
                await audioPlayer.play(audioPath, isLocal: true); // Указываем, что аудиофайл локальный
              },
            ),
          );
        },
      ),
    );
  }
}
