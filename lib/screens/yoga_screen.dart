import 'package:flutter/material.dart';

class YogaScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'title': 'Расслабление',
      'image': 'assets/images/relaxation.png',
    },
    {
      'title': 'Снятие стресса',
      'image': 'assets/images/stress.png',
    },
    {
      'title': 'Укрепление мышц',
      'image': 'assets/images/muscle1.png',
    },
    {
      'title': 'Гибкость',
      'image': 'assets/images/flexibility1.png',
    },
  ];

  final Map<String, List<Map<String, String>>> categoryDetails = {
    'Расслабление': [
      {
        'name': 'Шавасана',
        'description': 'Лягте на спину, руки и ноги расслаблены, закройте глаза и дышите глубоко.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с дыханием.',
        'warmup': 'Сделайте несколько глубоких вдохов и выдохов, чтобы расслабиться.'
      },
      {
        'name': 'Поза ребенка',
        'description': 'Сядьте на колени, наклонитесь вперед и вытяните руки перед собой, лбом коснитесь пола.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с коленями.',
        'warmup': 'Сделайте несколько наклонов вперед, чтобы подготовить тело.'
      },
      // Добавьте больше упражнений для категории "Расслабление"
    ],
    'Снятие стресса': [
      {
        'name': 'Бальасана',
        'description': 'Сядьте на колени, наклонитесь вперед и вытяните руки перед собой.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с коленями.',
        'warmup': 'Сделайте несколько наклонов вперед, чтобы подготовить тело.'
      },
      {
        'name': 'Поза кошки-коровы',
        'description': 'Станьте на четвереньки, чередуйте прогиб и выгиб спины.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с поясницей.',
        'warmup': 'Сделайте несколько круговых движений плечами для разминки.'
      },
      // Добавьте больше упражнений для категории "Снятие стресса"
    ],
    'Укрепление мышц': [
      {
        'name': 'Планка',
        'description': 'Примите упор лежа, руки под плечами, тело прямое.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с запястьями.',
        'warmup': 'Сделайте несколько наклонов и растяжек для подготовки мышц.'
      },
      {
        'name': 'Поза воина',
        'description': 'Встаньте прямо, сделайте широкий шаг вперед, согните переднюю ногу, задняя нога прямая.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с коленями.',
        'warmup': 'Сделайте несколько выпадающих шагов для разминки.'
      },
      // Добавьте больше упражнений для категории "Укрепление мышц"
    ],
    'Гибкость': [
      {
        'name': 'Кобра',
        'description': 'Лягте на живот, поднимите верхнюю часть тела, опираясь на руки.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с поясницей.',
        'warmup': 'Сделайте несколько мягких прогибов назад для разминки.'
      },
      {
        'name': 'Поза собаки мордой вниз',
        'description': 'Станьте на четвереньки, поднимите бедра вверх, вытягивая спину и ноги.',
        'warning': 'Избегайте этой позы, если у вас есть проблемы с запястьями.',
        'warmup': 'Сделайте несколько наклонов вперед для разминки.'
      },
      // Добавьте больше упражнений для категории "Гибкость"
    ],
  };

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
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/yoga.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Добро пожаловать на страницу йоги. Здесь вы найдете упражнения для расслабления, снятия стресса, укрепления мышц и повышения гибкости.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetailScreen(
                              categoryTitle: category['title']!,
                              categoryImage: category['image']!,
                              exercises: categoryDetails[category['title']!]!,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white.withOpacity(0.9),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                category['image']!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                category['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryImage;
  final List<Map<String, String>> exercises;

  CategoryDetailScreen({
    required this.categoryTitle,
    required this.categoryImage,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        categoryImage,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20),
                      Text(
                        categoryTitle,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Card(
                      color: Colors.white.withOpacity(0.9),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise['name']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Разминка: ${exercise['warmup']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              exercise['description']!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            if (exercise['warning'] != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Предупреждение: ${exercise['warning']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
