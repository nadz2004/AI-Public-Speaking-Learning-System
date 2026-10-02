import 'package:flutter/material.dart';
import 'prompt_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];

    return Scaffold(
      appBar: AppBar(title: const Text('Choose level')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: levels.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF101B2D),
              child: ListTile(
                title: Text(levels[index]),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PromptScreen(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
