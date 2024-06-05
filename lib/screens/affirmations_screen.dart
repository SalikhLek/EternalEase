import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

class AffirmationsScreen extends StatefulWidget {
  @override
  _AffirmationsScreenState createState() => _AffirmationsScreenState();
}

class _AffirmationsScreenState extends State<AffirmationsScreen> {
  final List<Map<String, String>> affirmations = [
    {
      'title': 'Аффирмация 1',
      'path': 'assets/audio/affirmation1.mp3',
    },
    {
      'title': 'Аффирмация 2',
      'path': 'assets/audio/affirmation2.mp3',
    },
    // Добавьте больше аффирмаций здесь
  ];

  FlutterSoundPlayer _audioPlayer = FlutterSoundPlayer();
  bool _isPlaying = false;
  bool _isPaused = false;
  double _playPosition = 0.0;
  String? _currentPath;

  @override
  void initState() {
    super.initState();
    _audioPlayer.openPlayer();
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
      setState(() {
        _playPosition = 0.0;
      });
      _currentPath = audioPath;
      await _audioPlayer.startPlayer(
        fromURI: audioPath,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {
            _isPlaying = false;
            _isPaused = false;
            _playPosition = 0.0;
          });
        },
      );
      _audioPlayer.onProgress!.listen((event) {
        if (event != null && event.duration != null) {
          setState(() {
            _playPosition = event.position.inMilliseconds /
                event.duration!.inMilliseconds;
          });
        }
      });
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
              subtitle: _isPlaying && _currentPath == audioPath
                  ? LinearProgressIndicator(
                value: _playPosition,
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
