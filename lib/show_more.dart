import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShowMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final String showMoreText;
  final TextStyle style;
  final TextStyle showMoreStyle;

  const ShowMoreText(
    this.text, {
    Key key,
    this.maxLength: 100,
    this.showMoreText,
    this.style,
    this.showMoreStyle,
  }) : super(key: key);

  @override
  _ShowMoreTextState createState() => _ShowMoreTextState();
}

class _ShowMoreTextState extends State<ShowMoreText> {
  bool full = false;

  @override
  Widget build(BuildContext context) {
    if (full || widget.text.length < widget.maxLength) {
      return Text(widget.text, style: widget.style);
    }

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: widget.text.substring(0, widget.maxLength)),
          TextSpan(text: '...'),
          TextSpan(
            text: 'more',
            style: Theme.of(context).textTheme.body2.copyWith(
                  color: Theme.of(context).accentColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => setState(() => full = true),
          ),
        ],
      ),
    );
  }
}
