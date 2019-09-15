import 'package:flutter/material.dart';
import 'package:show_more/show_more.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show More Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final veryLongText = 'Lorem ipsum dolor sit amet, consectetur adipiscing '
      'elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
      ' Pretium fusce id velit ut tortor. Scelerisque eleifend donec pretium '
      'vulputate. Malesuada pellentesque elit eget gravida. Ultrices eros in '
      'cursus turpis massa tincidunt. Morbi tincidunt augue interdum velit '
      'euismod in pellentesque. Turpis massa tincidunt dui ut ornare lectus '
      'sit amet. Eleifend quam adipiscing vitae proin sagittis. Id porta nibh '
      'venenatis cras sed felis eget velit aliquet. Donec enim diam vulputate '
      'ut pharetra sit amet aliquam id. Habitant morbi tristique senectus et. '
      'Nibh venenatis cras sed felis eget velit aliquet sagittis id. Dictum at '
      'tempor commodo ullamcorper. Velit aliquet sagittis id consectetur purus. '
      'Eget mi proin sed libero. Luctus accumsan tortor posuere ac ut '
      'consequat semper. Ullamcorper a lacus vestibulum sed.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show More Demo')),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          DataCard(
            title: 'Long Text',
            child: ShowMoreText(veryLongText),
          ),
          DataCard(
            title: 'Long Text With Animation',
            child: AnimatedSize(
              child: ShowMoreText(veryLongText),
              duration: Duration(milliseconds: 300),
              vsync: this,
              alignment: Alignment.topCenter,
            ),
          ),
          DataCard(
            title: 'Short Text',
            child: ShowMoreText(veryLongText.substring(0,90)),
          ),
        ],
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  final String title;
  final Widget child;

  const DataCard({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.greenAccent,
            height: 160,
            padding: EdgeInsets.all(16),
            child: FlutterLogo(style: FlutterLogoStyle.horizontal),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 8),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
