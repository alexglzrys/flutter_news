import 'package:flutter/material.dart';

// Modelo para manejar el estado de la navegación de mi aplicación mediante Provider
class NavigationProvider extends ChangeNotifier {
  // La página actual que se muestra en la aplicación
  int _currentPage = 0;

  // Getter para obtener la página actual
  int get currentPage => _currentPage;
  // Seeter para establecer la nueva página actual a mostrar en la aplicación
  set currentPage(int value) {
    _currentPage = value;
    // Notificar a todos los widgets suscritos a este provider, que deben volver a renderizarse para mostrar los nuevos cambios
    notifyListeners();
  }
}
