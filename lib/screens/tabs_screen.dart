import 'package:flutter/material.dart';

class TabsSreen extends StatelessWidget {
  const TabsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // PageView es un widget que se utiliza para mostrar una colección de páginas deslizables, generalmente horizontalmente. Cada página puede contener contenido diferente, como imágenes, texto, formularios u otros widgets personalizados. Se utiliza comúnmente para implementar patrones de navegación tipo "carrete" o "deslizar para cambiar"
        body: PageView(
      physics: const BouncingScrollPhysics(),
      children: [Container(color: Colors.amber), Container(color: Colors.teal)],
    ));
  }
}
