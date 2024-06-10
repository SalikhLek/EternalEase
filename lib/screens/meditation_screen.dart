import 'package:flutter/material.dart';
import 'package:gpt_dipl/screens/affirmations_screen.dart' as affirmations;
import 'package:gpt_dipl/screens/productivity_screen.dart' as productivity;
import 'package:gpt_dipl/screens/stress_screen.dart' as stress;
import 'package:gpt_dipl/screens/mindfulness_screen.dart' as mindfulness;
import 'package:gpt_dipl/screens/sleep_screen.dart' as sleep;

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCategoryItem(
            context,
            'Аффирмации',
            affirmations.AffirmationsScreen(),
          ),
          _buildCategoryItem(
            context,
            'Звуки природы',
            productivity.ProductivityScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, Widget screen) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
