import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';
import 'package:news_flutter_app/theme/news_dark.dart';

void main() => runApp(const NewsApp());

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: newsDarkTheme,
        home: const TabsSreen());
  }
}
