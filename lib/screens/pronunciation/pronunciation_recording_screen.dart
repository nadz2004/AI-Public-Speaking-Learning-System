import 'dart:async';
import 'package:flutter/material.dart';
import 'pronunciation_feedback_screen.dart';

class PronunciationRecordingScreen extends StatefulWidget {
  const PronunciationRecordingScreen({super.key});

  @override
  State<PronunciationRecordingScreen> createState() => _PronunciationRecordingScreenState();
}

class _PronunciationRecordingScreenState extends State<PronunciationRecordingScreen> {
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
        MaterialPageRoute(builder: (_) => const PronunciationFeedbackScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pronunciation practice')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Word: articulate',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            const Text('Listen and repeat the word clearly.', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 28),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _isRecording ? Colors.red.withOpacity(0.2) : Colors.blue.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isRecording ? Icons.mic : Icons.mic_none_rounded,
                size: 46,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${(_seconds ~/ 60).toString().padLeft(2, '0')} : ${(_seconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),
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
