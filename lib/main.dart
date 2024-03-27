import 'package:flutter/material.dart';
import 'package:news_flutter_app/providers/navigation_provider.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/theme/news_dark.dart';
import 'package:provider/provider.dart';

void main() => runApp(
        // Implementar Provider como manejador de estado de la aplicación (ChangeNotifierProvider para una sola instancia, MultiProvider para multiples instancias)
        MultiProvider(
      // Generar las instancias singletón (gestionadas por Provider) que se usarán de forma global en la aplicación
      // Por defecto estas instancias son lazy, es decir, se crean bajo demanda. Sin embargo, se puede especificar que se generen desde el momento que se lanza la aplicación
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => NewsService())
      ],
      child: const NewsApp(),
    ));

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
