import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

// Widget que representa una página asocaada al tab de navegación inferior de mi aplicación
class TabPrimaryScreen extends StatelessWidget {
  const TabPrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia de NewsService gestionada por el Provider
    final newsService = Provider.of<NewsService>(context);

    // Pasar el listado de noticias a ListNews para su renderización
    return ListNews(news: newsService.headlines);
  }
}
