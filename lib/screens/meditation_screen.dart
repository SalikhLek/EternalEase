import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationScreen extends StatelessWidget {
  final List<String> categories = [
    'Аффирмации',
    'Увеличение продуктивности',
    'Снятие стресса и беспокойства',
    'Развитие осознанности',
    'Гармония и баланс',
    'Улучшение сна',
  ];

  final Map<String, String> audioLinks = {
    'Аффирмации': 'https://www.example.com/path-to-your-audio-file.mp3',
    // Добавьте другие категории и ссылки, если нужно
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Медитация'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white.withOpacity(0.8),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final category = categories[index];
                    if (audioLinks.containsKey(category)) {
                      final audioUrl = audioLinks[category]!;
                      AudioPlayer audioPlayer = AudioPlayer();
                      await audioPlayer.play(audioUrl);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
