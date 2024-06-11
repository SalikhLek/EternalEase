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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nature_background.jpg'), // Замените на путь к вашему фоновому изображению
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            buildCategoryItem(
              context,
              'Аффирмации',
              affirmations.AffirmationsScreen(),
              Icons.self_improvement,
            ),
            buildCategoryItem(
              context,
              'Звуки природы',
              productivity.ProductivityScreen(),
              Icons.nature,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(
      BuildContext context, String title, Widget screen, IconData icon) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.teal,
        ),
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