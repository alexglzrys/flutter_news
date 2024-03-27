import 'package:flutter/material.dart';
import 'package:news_flutter_app/providers/navigation_provider.dart';
import 'package:news_flutter_app/screens/tab_primary_screen.dart';
import 'package:provider/provider.dart';

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
    // Recuperar la instancia singletón (gestionda por Provider) referente al estado de la navegación de mi aplicación
    final navigationProvider = Provider.of<NavigationProvider>(context);

    // BottomNavigationBar es un widget que se utiliza comúnmente para proporcionar una navegación entre varias vistas o secciones de una aplicación, generalmente ubicado en la parte inferior de la pantalla. Cada elemento del BottomNavigationBar representa una opción de navegación y puede estar asociado con una página o una acción específica dentro de la aplicación.
    return BottomNavigationBar(
      items: const [
        // Icono asociado al tab 1
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para tí'),
        // Icono asociado al tab 2
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
      ],
      // El tab actualmente seleccionado
      currentIndex: navigationProvider.currentPage,
      onTap: (value) {
        print('Tab seleccionado: $value');
        // Establecer la nueva página actual seleccionada por el usuario
        // Cualquier widget suscrito a NavigationProvider, Provider le notificará de los cambios, y en consecuencia se volverá a redibujar
        navigationProvider.currentPage = value;
      },
    );
  }
}

// Widget privado referente a las páginas de mi aplicación
class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recuperar la instancia singletón (gestionda por Provider) referente al estado de la navegación de mi aplicación
    final navigationProvider = Provider.of<NavigationProvider>(context);

    // PageView es un widget que se utiliza para mostrar una colección de páginas deslizables, generalmente horizontalmente. Cada página puede contener contenido diferente, como imágenes, texto, formularios u otros widgets personalizados. Se utiliza comúnmente para implementar patrones de navegación tipo "carrete" o "deslizar para cambiar"
    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics:
          const NeverScrollableScrollPhysics(), // El usuario no podrá hacer scroll para moverse entre las páginas de este PageView
      // Asociar el controlador que gestionará este widget (el widget reaccionará a los cambios que se hagan desde el controlador)
      controller: navigationProvider.pageController,
      children: [
        TabPrimaryScreen(),
        Container(
          color: Colors.teal,
          child: Center(child: Text('Página #2')),
        )
      ],
    );
  }
}
