import 'package:flutter/material.dart';
import 'package:news_flutter_app/providers/navigation_provider.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';
import 'package:news_flutter_app/theme/news_dark.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      // Implementar Provider como manejador de estado de la aplicación
      // Generar la instancia singletón (gestionada por Provider) que se usará de forma global en la aplicación
      ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
        child: const NewsApp(),
      ),
    );

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
