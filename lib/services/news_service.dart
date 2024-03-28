import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_flutter_app/models/news_models.dart';
import 'package:news_flutter_app/models/category_model.dart';

// Servicio que realiza diferentes peticiones HTTP al endpoint de News API

// Utilizamos caracteristicas de mixin (with) para reutilizar el código de múltiples clases de manera flexible y no jerárquica (herencia multiple)
// ChangeNotifier es una clase de flutter diseñada para ayudar en la gestión del estado, permitiendo notificar a los observadores (widgets) cuando su estado ha canbiado y actualizar la UI en consecuencioa
class NewsService with ChangeNotifier {
  final String _endPoint = 'https://newsapi.org/v2';
  final String _apiKey = '0e0f66025397445d850fbf3c58d16275';

  // Listado de encabezados o noticias de primer plana
  List<Article> headlines = [];

  // Listado de categorias
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    // Endpoint para obtener el listado de encabezados o noticias de primera plana en México
    final url = '$_endPoint/top-headlines?apiKey=$_apiKey&country=us';
    final response = await http.get(Uri.parse(url));
    // Convertir la respuesta JSON a la representación del modelo de tipo NewsResponse
    final newsResponse = NewsResponse.fromRawJson(response.body);
    // agregar las noticias a mi listado de encabexados
    headlines.addAll(newsResponse.articles);
    // Notificar a todos los subscritores de este servicio que han llegado nuevas noticias
    notifyListeners();

    print('Cargando Top Headlines....');
  }
}
