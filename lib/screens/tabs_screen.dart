import 'package:flutter/material.dart';

class TabsSreen extends StatelessWidget {
  const TabsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

// Widget privado referente a la navegación por bloques de mi aplicación
class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BottomNavigationBar es un widget que se utiliza comúnmente para proporcionar una navegación entre varias vistas o secciones de una aplicación, generalmente ubicado en la parte inferior de la pantalla. Cada elemento del BottomNavigationBar representa una opción de navegación y puede estar asociado con una página o una acción específica dentro de la aplicación.
    return BottomNavigationBar(
      items: const [
        // Icono asociado al tab 1
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para tí'),
        // Icono asociado al tab 2
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
      ],
      currentIndex: 0,
    );
  }
}

// Widget privado referente a las páginas de mi aplicación
class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PageView es un widget que se utiliza para mostrar una colección de páginas deslizables, generalmente horizontalmente. Cada página puede contener contenido diferente, como imágenes, texto, formularios u otros widgets personalizados. Se utiliza comúnmente para implementar patrones de navegación tipo "carrete" o "deslizar para cambiar"
    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          //color: Colors.amber,
          child: const Center(
            child: Text('Página 1'),
          ),
        ),
        Container(
          color: Colors.teal,
          child: Center(child: Text('Página #2')),
        )
      ],
    );
  }
}
