import 'package:flutter/material.dart';

class YogaScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'title': 'Расслабление',
      'imagePath': 'assets/images/relaxation.jpg',
    },
    {
      'title': 'Снятие стресса',
      'imagePath': 'assets/images/stress_relief.jpg',
    },
    {
      'title': 'Гибкость',
      'imagePath': 'assets/images/flexibility.jpg',
    },
    {
      'title': 'Баланс',
      'imagePath': 'assets/images/balance.jpg',
    },
    {
      'title': 'Сила',
      'imagePath': 'assets/images/strength.jpg',
    },
    {
      'title': 'Дыхание',
      'imagePath': 'assets/images/breathing.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2, // Пропорции изображения заголовка
                  child: Image.asset(
                    'assets/images/yoga.png', // Путь к вашему заголовку-изображению
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'На этой странице вы найдете упражнения для расслабления, снятия стресса и улучшения вашего общего состояния.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Категории упражнений',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        // Обработчик нажатия на категорию
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(category['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              category['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
