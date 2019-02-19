import 'package:flutter/material.dart';
import 'src/screens/list_news.dart';
import 'src/blocs/stories_provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News !',
        home: ListNews(),
      ),
    );
  }
}
