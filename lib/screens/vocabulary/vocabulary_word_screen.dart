import 'package:flutter/material.dart';
import 'vocabulary_activity_screen.dart';

class VocabularyWordScreen extends StatelessWidget {
  const VocabularyWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vocabulary word')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Word', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 8),
            const Text(
              'Persuade',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            const Text(
              'Definition: to cause someone to do or believe something by giving reasons or arguments.',
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const VocabularyActivityScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
