import 'package:flutter/material.dart';

final newsDarkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
        // Establecer el color de acento secundario para algunos elementos de la UI como botones, barras de progreso, etc.
        // Necesario para diferenciar un color más prominente del tema oscuro usado en la aplicación
        secondary: Colors.blue));
