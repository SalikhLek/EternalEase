import 'package:flutter/material.dart';
import 'affirmations_screen.dart';
import 'productivity_screen.dart';
import 'stress_screen.dart';
import 'mindfulness_screen.dart';
import 'harmony_screen.dart';
import 'sleep_screen.dart';

class MeditationScreen extends StatelessWidget {
  final List<String> categories = [
    'Аффирмации',
    'Увеличение продуктивности',
    'Снятие стресса и беспокойства',
    'Развитие осознанности',
    'Гармония и баланс',
    'Улучшение сна',
  ];

  void navigateToCategory(BuildContext context, String category) {
    Widget screen;
    switch (category) {
      case 'Аффирмации':
        screen = AffirmationsScreen();
        break;
      case 'Увеличение продуктивности':
        screen = ProductivityScreen();
        break;
      case 'Снятие стресса и беспокойства':
        screen = StressScreen();
        break;
      case 'Развитие осознанности':
        screen = MindfulnessScreen();
        break;
      case 'Гармония и баланс':
        screen = HarmonyScreen();
        break;
      case 'Улучшение сна':
        screen = SleepScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(categories[index]),
                  onTap: () => navigateToCategory(context, categories[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
