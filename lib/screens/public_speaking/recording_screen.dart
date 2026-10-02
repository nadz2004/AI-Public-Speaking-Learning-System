import 'dart:async';
import 'package:flutter/material.dart';
import 'feedback_screen.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool _isRecording = false;
  int _seconds = 0;
  Timer? _timer;

  void _toggleRecording() {
    setState(() => _isRecording = !_isRecording);

    if (_isRecording) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() => _seconds++);
      });
    } else {
      _timer?.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FeedbackScreen()),
      );
    }
  }

  String get _timeLabel => '${(_seconds ~/ 60).toString().padLeft(2, '0')} : ${(_seconds % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: _isRecording ? Colors.red.withOpacity(0.2) : Colors.blue.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isRecording ? Icons.mic : Icons.mic_none_rounded,
                size: 56,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _timeLabel,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              _isRecording ? 'Recording...' : 'Press to start recording',
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _toggleRecording,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: _isRecording ? Colors.red : Colors.blue,
                ),
                child: Text(_isRecording ? 'Stop recording' : 'Start recording'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
