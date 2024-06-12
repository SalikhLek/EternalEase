import 'package:flutter/material.dart';
import 'affirmations_screen.dart';
import 'nature_screen.dart';

class MeditationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Аффирмации',
      'screen': AffirmationsScreen(),
      'image': 'assets/images/affirmation.png', // замените на путь к вашему изображению
    },
    {
      'title': 'Звуки природы',
      'screen': NatureScreen(),
      'image': 'assets/images/nature.png', // замените на путь к вашему изображению
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final title = categories[index]['title']!;
            final screen = categories[index]['screen']!;
            final image = categories[index]['image']!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
                child: Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        width: 110,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(image, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
