import 'package:flutter/material.dart';
import 'public_speaking/public_speaking_home.dart';
import 'vocabulary/vocabulary_home.dart';
import 'pronunciation/pronunciation_home.dart';
import 'progress_screen.dart';

class FeatureSelectionScreen extends StatelessWidget {
  const FeatureSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Public speaking',
        'subtitle': 'Flow B',
        'icon': Icons.record_voice_over_rounded,
        'screen': const PublicSpeakingHomeScreen(),
      },
      {
        'title': 'Vocabulary',
        'subtitle': 'Flow C',
        'icon': Icons.menu_book_rounded,
        'screen': const VocabularyHomeScreen(),
      },
      {
        'title': 'Pronunciation',
        'subtitle': 'Flow D',
        'icon': Icons.spellcheck_rounded,
        'screen': const PronunciationHomeScreen(),
      },
      {
        'title': 'View progress',
        'subtitle': 'Flow E',
        'icon': Icons.bar_chart_rounded,
        'screen': const ProgressScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose feature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item['screen'] as Widget),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF101B2D),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'] as IconData, size: 30),
                    const SizedBox(height: 16),
                    Text(
                      item['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['subtitle'] as String,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
