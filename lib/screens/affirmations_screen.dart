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
      appBar: AppBar(
        title: Text('Аффирмации'),
      ),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final title = affirmations[index]['title']!;
          final audioPath = affirmations[index]['path']!;
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text(title),
              trailing: IconButton(
                icon: Icon(_isPlaying && _currentPath == audioPath
                    ? Icons.pause
                    : Icons.play_arrow),
                onPressed: () => _togglePlayback(audioPath),
              ),
            ),
          );
        },
      ),
    );
  }
}
