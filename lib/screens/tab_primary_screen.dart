import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

// Widget que representa una página asocaada al tab de navegación inferior de mi aplicación
class TabPrimaryScreen extends StatefulWidget {
  const TabPrimaryScreen({super.key});

  @override
  State<TabPrimaryScreen> createState() => _TabPrimaryScreenState();
}

// AutomaticKeepAliveClientMixin es una mixin en Flutter que se utiliza para mantener vivo el estado de un widget incluso cuando el widget no está actualmente visible en la pantalla. Este mixin se utiliza junto con wantKeepAlive, que es un getter que debes sobrescribir para indicar si deseas mantener vivo el estado del widget.
class _TabPrimaryScreenState extends State<TabPrimaryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // Required for AutomaticKeepAliveClientMixin
    super.build(context);

    // Obtener la instancia de NewsService gestionada por el Provider
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    // Pasar el listado de noticias a ListNews para su renderización
    // Mostrar un indicador de progreso si el listado de noticias de cabecera esta vacío
    return headlines.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListNews(news: headlines);
  }

  // wantKeepAlive = true, el framework de Flutter se asegura de que el estado del widget no se destruya cuando el widget sale de la vista y se reconstruya nuevamente. Esto es útil para mantener el estado de los widgets, especialmente en casos como listas largas o páginas con pestañas, donde los widgets pueden entrar y salir de la vista debido al desplazamiento o la navegación entre pestañas (conservar el scroll).
  @override
  bool get wantKeepAlive => true;
}
