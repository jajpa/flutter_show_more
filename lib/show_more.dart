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
  TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => setState(() => full = true);
  }

  @override
  Widget build(BuildContext context) {
    if (full || widget.text.length <= widget.maxLength) {
      return Text(widget.text, style: widget.style);
    }

    var substring = widget.text.substring(0, widget.maxLength);
    var showMoreStyle = widget.showMoreStyle ??
        Theme.of(context).textTheme.body2.copyWith(
              color: Theme.of(context).accentColor,
            );

    return Text.rich(
      TextSpan(
        style: widget.style,
        children: [
          TextSpan(text: substring),
          TextSpan(text: '... '),
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
