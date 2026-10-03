import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShowMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final String? showMoreText;
  final TextStyle? style;
  final TextStyle? showMoreStyle;
  final bool shouldShowLessText;
  final String? showLessText;

  const ShowMoreText(
    this.text, {
    super.key,
    this.maxLength = 100,
    this.showMoreText,
    this.style,
    this.showMoreStyle,
    this.shouldShowLessText = false,
    this.showLessText,
  });

  @override
  State<ShowMoreText> createState() => _ShowMoreTextState();
}

class _ShowMoreTextState extends State<ShowMoreText> {
  bool full = false;
  late TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => setState(() => full = !full);
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.characters.length <= widget.maxLength) {
      return Text(widget.text, style: widget.style);
    }

    final showMoreStyle = widget.showMoreStyle ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            );

    if (full) {
      if (widget.shouldShowLessText) {
        return Text.rich(
          TextSpan(
            style: widget.style,
            children: [
              TextSpan(text: widget.text),
              const TextSpan(text: ' '),
              TextSpan(
                text: widget.showLessText ?? 'less',
                style: showMoreStyle,
                recognizer: tapGestureRecognizer,
              ),
            ],
          ),
        );
      } else {
        return Text(widget.text, style: widget.style);
      }
    }

    final substring = widget.text.characters.take(widget.maxLength).toString();

    return Text.rich(
      TextSpan(
        style: widget.style,
        children: [
          TextSpan(text: substring),
          const TextSpan(text: '... '),
          TextSpan(
            text: widget.showMoreText ?? 'more',
            style: showMoreStyle,
            recognizer: tapGestureRecognizer,
          ),
        ],
      ),
    );
  }
}
