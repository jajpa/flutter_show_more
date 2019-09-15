# show_more

Flutter widget for limiting the amount of text to show.

[![pub package](https://img.shields.io/pub/v/show_more.svg?style=popout)](https://pub.dartlang.org/packages/show_more)

## Installation

Add this to your package's pubspec.yaml file

```yaml
dependencies:
  ...
  show_more: ^latest.version.here
```

## Usage
First import show_more.dart

```dart
import 'package:show_more/show_more.dart';
```

`ShowMoreText` with all attributes

```dart
ShowMoreText(
  veryLongText,
  maxLength: 100,
  style: TextStyle(fontSize: 12, color: Colors.grey),
  showMoreText: 'show more',
  showMoreStyle: TextStyle(
  fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).accentColor,
  ),
  shouldShowLessText: true,
  showLessText: 'show less',
),
```

## Screenshots

<image src="https://i.imgur.com/uAX7jZZ.gif" width="250px"/>

## License
[MIT License](https://github.com/joshmatta/show_more/blob/master/LICENSE)
