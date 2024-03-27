import 'package:flutter/material.dart';
import 'package:news_flutter_app/models/news_models.dart';

// Servicio que realiza diferentes peticiones HTTP al endpoint de News API

// Utilizamos caracteristicas de mixin (with) para reutilizar el código de múltiples clases de manera flexible y no jerárquica (herencia multiple)
// ChangeNotifier es una clase de flutter diseñada para ayudar en la gestión del estado, permitiendo notificar a los observadores (widgets) cuando su estado ha canbiado y actualizar la UI en consecuencioa
class NewsService with ChangeNotifier {
  // Listado de encabezados o noticias de primer plana
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Cargando Top Headlines....');
  }
}
