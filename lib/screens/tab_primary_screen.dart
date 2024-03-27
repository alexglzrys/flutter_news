import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:provider/provider.dart';

// Widget que representa una página asocaada al tab de navegación inferior de mi aplicación
class TabPrimaryScreen extends StatelessWidget {
  const TabPrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia de NewsService gestionada por el Provider
    final newsService = Provider.of<NewsService>(context);

    return const Center(
      child: Text('Página Tab 1'),
    );
  }
}
