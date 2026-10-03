import 'package:flutter/material.dart';
import 'package:flutter_show_more/flutter_show_more.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show More Text Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ShowMoreTextExample(),
    );
  }
}

class ShowMoreTextExample extends StatelessWidget {
  const ShowMoreTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_show_more')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Demo Widget:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ShowMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Nullam auctor, nunc id aliquam tincidunt, nisl nunc '
                    'tincidunt urna, vitae aliquam nunc nisl id nunc. '
                    'Pellentesque habitant morbi tristique senectus et netus '
                    'et malesuada fames ac turpis egestas. 👨‍👩‍👧‍👦 emojis and '
                    'complex characters are handled perfectly!',
                    maxLength: 80,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    showMoreText: 'Read more',
                    showMoreStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    shouldShowLessText: true,
                    showLessText: 'Read less',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
