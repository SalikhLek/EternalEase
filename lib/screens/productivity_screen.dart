import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ProductivityScreen extends StatelessWidget {
  final List<Map<String, String>> productivityAudios = [
    {
      'title': 'Продуктивность 1',
      'url': 'https://www.example.com/path-to-your-audio-file3.mp3',
    },
    {
      'title': 'Продуктивность 2',
      'url': 'https://www.example.com/path-to-your-audio-file4.mp3',
    },
    // Добавьте больше аудио здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Увеличение продуктивности'),
      ),
      body: ListView.builder(
        itemCount: productivityAudios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(productivityAudios[index]['title']!),
              onTap: () async {
                final audioUrl = productivityAudios[index]['url']!;
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
