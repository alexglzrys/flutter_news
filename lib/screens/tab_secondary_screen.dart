import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:provider/provider.dart';

class TabSecondaryScreen extends StatelessWidget {
  const TabSecondaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          // Column y ListView.builder son widgets que ocupan todo el espacio disponible y tienen comportamientos de desplazamiento diferentes.
          // Cuando intentas colocar un ListView.builder directamente dentro de una Column, estás colocando dos widgets que intentan ocupar todo el espacio disponible al mismo tiempo. Esto genera un conflicto en el diseño y Flutter lanza un error para indicar que esta configuración es incompatible.
          // Para solucionar este problema, puedes envolver el ListView.builder dentro de un widget Expanded o Flexible para indicarle a Column que debe asignarle solo el espacio vertical necesario para mostrar todos sus hijos
          Expanded(child: _ListCategories())
        ],
      ),
    );
  }
}

// Widget encargado de mostrar el listado de categorías disponibles
class _ListCategories extends StatelessWidget {
  const _ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el listado de categorías situado en nuestro servicio de noticias
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Icon(categories[index].icon),
            const SizedBox(height: 5),
            Text(categories[index].name)
          ]),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      // Establece la física del desplazamiento. Esto significa que cuando el usuario desplaza el contenido y llega al límite del scroll, el ListView realizará un efecto de rebote.
      physics: const BouncingScrollPhysics(),
    );
  }
}
