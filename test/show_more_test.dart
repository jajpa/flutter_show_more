import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_show_more/flutter_show_more.dart';

void main() {
  testWidgets('ShowMoreText displays and expands', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShowMoreText(
            'Hello World! This is a long text to test the show more functionality.',
            maxLength: 10,
            shouldShowLessText: true,
          ),
        ),
      ),
    );

    final richText = tester.widget<RichText>(find.byType(RichText));
    final rootSpan = richText.text as TextSpan;
    final ourSpan = rootSpan.children![0] as TextSpan;

    expect(rootSpan.toPlainText(), 'Hello Worl... more');

    // Tap 'more'
    final moreSpan = ourSpan.children![2] as TextSpan;
    final recognizer = moreSpan.recognizer as TapGestureRecognizer;
    recognizer.onTap!();

    await tester.pumpAndSettle();

    final expandedRichText = tester.widget<RichText>(find.byType(RichText));
    final expandedTextSpan = expandedRichText.text as TextSpan;
    expect(expandedTextSpan.toPlainText(),
        'Hello World! This is a long text to test the show more functionality. less');
  });
}
