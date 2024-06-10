import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ProductivityScreen extends StatefulWidget {
  @override
  _ProductivityScreenState createState() => _ProductivityScreenState();
}

class _ProductivityScreenState extends State<ProductivityScreen> {
  final List<Map<String, String>> productivityTracks = [
    {
      'title': 'Утренняя медитация',
      'path': 'assets/audio/productivity1.mp3',
    },
    {
      'title': 'Фокус на работе',
      'path': 'assets/audio/productivity2.mp3',
    },
    {
      'title': 'Энергия для дня',
      'path': 'assets/audio/productivity3.mp3',
    },
    {
      'title': 'Расслабление после работы',
      'path': 'assets/audio/productivity4.mp3',
    },
    {
      'title': 'Вечерняя медитация',
      'path': 'assets/audio/productivity5.mp3',
    },
    {
      'title': 'Мотивация на успех',
      'path': 'assets/audio/productivity6.mp3',
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
      appBar: AppBar(
        title: Text('Увеличение продуктивности'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: productivityTracks.length,
          itemBuilder: (context, index) {
            final title = productivityTracks[index]['title']!;
            final audioPath = productivityTracks[index]['path']!;
            return Card(
              color: Colors.white.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.music_note, color: Colors.blueAccent),
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isPlaying && _currentPath == audioPath
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                  onPressed: () => _togglePlayback(audioPath),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
