import 'package:flutter/material.dart';
import 'package:news_flutter_app/helpers/helpers.dart';
import 'package:news_flutter_app/models/category_model.dart';
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
            _IconCategory(category: categories[index]),
            const SizedBox(height: 5),
            // Usar un helper personalziado para capitalizar textos
            Text(capitalize(categories[index].name))
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

// Widget que personaliza la apariencia del icono de categoría
class _IconCategory extends StatelessWidget {
  const _IconCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: Colors.black38,
        ),
      ),
      onTap: () {
        // Establecer la neuva categoria seleccionada
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
        print(category.name);
      },
    );
  }
}
