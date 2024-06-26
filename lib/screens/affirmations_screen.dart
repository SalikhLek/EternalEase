import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class AffirmationsScreen extends StatefulWidget {
  @override
  _AffirmationsScreenState createState() => _AffirmationsScreenState();
}

class _AffirmationsScreenState extends State<AffirmationsScreen> {
  final List<Map<String, String>> affirmations = [
    {
      'title': 'Для избавления от страха',
      'path': 'assets/audio/affirmation1.mp3',
    },
    {
      'title': 'Благодарности вселенной',
      'path': 'assets/audio/affirmation2.mp3',
    },
    {
      'title': 'На перемены в жизни',
      'path': 'assets/audio/affirmation3.mp3',
    },
    {
      'title': 'Успокаивающие: перед сном',
      'path': 'assets/audio/affirmation4.mp3',
    },
    {
      'title': 'Для поиска работы',
      'path': 'assets/audio/affirmation5.mp3',
    },
    {
      'title': 'Для каждого дня на благополучие',
      'path': 'assets/audio/affirmation6.mp3',
    },
    {
      'title': 'На любовь: укрепление чувств',
      'path': 'assets/audio/affirmation7.mp3',
    }
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
                      'assets/images/affirmation.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Здесь вы можете прослушать мотивационные аффирмации и настроиться на позитивный лад.',
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
                  itemCount: affirmations.length,
                  itemBuilder: (context, index) {
                    final title = affirmations[index]['title']!;
                    final audioPath = affirmations[index]['path']!;
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
                'Аффирмации',
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