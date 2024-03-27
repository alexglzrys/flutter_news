import 'package:flutter/material.dart';
import 'package:news_flutter_app/models/news_models.dart';

// Widget para mostrar el listado de noticias de primera plana
class ListNews extends StatelessWidget {
  // El listado de noticias a mostrar
  final List<Article> news;
  const ListNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(news[index].title ?? 'Sin titulo');
      },
      itemCount: news.length,
    );
  }
}
