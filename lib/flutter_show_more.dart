import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShowMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final String showMoreText;
  final TextStyle style;
  final TextStyle showMoreStyle;
  final bool shouldShowLessText;
  final String showLessText;

  const ShowMoreText(
    this.text, {
    Key key,
    this.maxLength: 100,
    this.showMoreText,
    this.style,
    this.showMoreStyle,
    this.shouldShowLessText: false,
    this.showLessText,
  })  : assert(text != null),
        assert(maxLength != null),
        assert(shouldShowLessText != null),
        super(key: key);

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
      ..onTap = () => setState(() => full = !full);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.length <= widget.maxLength) {
      return Text(widget.text, style: widget.style);
    }

    var showMoreStyle = widget.showMoreStyle ??
        Theme.of(context).textTheme.body2.copyWith(
              color: Theme.of(context).accentColor,
            );

    if (full) {
      if (widget.shouldShowLessText) {
        return Text.rich(
          TextSpan(
            style: widget.style,
            children: [
              TextSpan(text: widget.text),
              TextSpan(text: ' '),
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

    var substring = widget.text.substring(0, widget.maxLength);

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
