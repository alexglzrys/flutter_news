import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';

void main() => runApp(const NewsApp());

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: TabsSreen());
  }
}
