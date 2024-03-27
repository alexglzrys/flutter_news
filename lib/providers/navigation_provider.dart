import 'package:flutter/material.dart';

// Modelo para manejar el estado de la navegación de mi aplicación mediante Provider
class NavigationProvider extends ChangeNotifier {
  // La página actual que se muestra en la aplicación
  int _currentPage = 0;
  // El controlador asociado a nuestro PageView
  final PageController _pageController = PageController();

  // Getters
  // Getter para obtener la página actual
  int get currentPage => _currentPage;
  // Getter pra obtener el controlador de página (usado por un PageView)
  PageController get pageController => _pageController;

  // Seeter para establecer la nueva página actual a mostrar en la aplicación
  set currentPage(int value) {
    _currentPage = value;
    // Moverse a otra página listada en un PageView
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
    // Notificar a todos los widgets suscritos a este provider, que deben volver a renderizarse para mostrar los nuevos cambios
    notifyListeners();
  }
}
