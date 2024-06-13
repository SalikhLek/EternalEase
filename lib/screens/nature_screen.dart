import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class NatureScreen extends StatefulWidget {
  @override
  _NatureScreenState createState() => _NatureScreenState();
}

class _NatureScreenState extends State<NatureScreen> {
  final List<Map<String, String>> natureTracks = [
    {
      'title': 'Спокойствие',
      'path': 'assets/audio/nature1.mp3',
    },
    {
      'title': 'Радужный рассвет',
      'path': 'assets/audio/nature2.mp3',
    },
    {
      'title': 'Бриз с горизонта',
      'path': 'assets/audio/nature3.mp3',
    },
    {
      'title': 'Безмятежность у реки',
      'path': 'assets/audio/nature4.mp3',
    },
    {
      'title': 'Скалистый шум',
      'path': 'assets/audio/nature5.mp3',
    },
    {
      'title': 'Система центавра',
      'path': 'assets/audio/nature6.mp3',
    },
    {
      'title': 'Капли в пещере',
      'path': 'assets/audio/nature7.mp3',
    },
    {
      'title': 'Море',
      'path': 'assets/audio/nature8.mp3',
    },
    {
      'title': 'Хром',
      'path': 'assets/audio/nature9.mp3',
    },
    {
      'title': 'Импульс',
      'path': 'assets/audio/nature10.mp3',
    },
    {
      'title': 'Сканирование',
      'path': 'assets/audio/nature11.mp3',
    },
    {
      'title': 'Прибой',
      'path': 'assets/audio/nature12.mp3',
    },
    {
      'title': 'Бинауральные ритмы',
      'path': 'assets/audio/nature13.mp3',
    },
    {
      'title': 'Песня звезд',
      'path': 'assets/audio/nature14.mp3',
    },
    {
      'title': 'Ветер с дождем',
      'path': 'assets/audio/nature15.mp3',
    },
  ];

  FlutterSoundPlayer _audioPlayer = FlutterSoundPlayer();
  bool _isPlaying = false;
  bool _isPaused = false;
  String? _currentPath;

  @override
  void initState() {
    super.initState();
    _audioPlayer.openPlayer().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _audioPlayer.closePlayer();
    super.dispose();
  }

  Future<void> _togglePlayback(String audioPath) async {
    if (_isPlaying && _currentPath == audioPath) {
      await _audioPlayer.pausePlayer();
      setState(() {
        _isPaused = true;
        _isPlaying = false;
      });
    } else if (_isPaused && _currentPath == audioPath) {
      await _audioPlayer.resumePlayer();
      setState(() {
        _isPaused = false;
        _isPlaying = true;
      });
    } else {
      await _audioPlayer.stopPlayer();
      _currentPath = audioPath;
      await _audioPlayer.startPlayer(
        fromURI: audioPath,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {
            _isPlaying = false;
            _isPaused = false;
          });
        },
      );
      setState(() {
        _isPlaying = true;
        _isPaused = false;
      });
    }
  }

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
                SizedBox(height: MediaQuery.of(context).padding.top),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(
                      'assets/images/nature.png', // Используйте нужное изображение
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Здесь вы можете слушать звуки природы и наслаждаться их умиротворением.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: natureTracks.length,
                  itemBuilder: (context, index) {
                    final title = natureTracks[index]['title']!;
                    final audioPath = natureTracks[index]['path']!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Card(
                        color: Colors.white.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(Icons.music_note, color: Colors.blue.shade700),
                          title: Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              _isPlaying && _currentPath == audioPath
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              color: Colors.blue.shade700,
                              size: 30,
                            ),
                            onPressed: () => _togglePlayback(audioPath),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'Звуки природы',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
