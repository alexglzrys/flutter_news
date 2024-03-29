import 'package:flutter/material.dart';
import 'package:news_flutter_app/models/news_models.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget para mostrar el listado de noticias de primera plana
class ListNews extends StatelessWidget {
  // El listado de noticias a mostrar
  final List<Article> news;
  const ListNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsCard(news: news[index], index: index);
      },
      itemCount: news.length,
    );
  }
}

// Widget que agrupa el contenido de una noticia en un Card personalizado
class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    required this.index,
  });

  // Noticia
  final Article news;
  // Posición en el listado de noticias
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(children: [
        CardHeader(source: news.source!.name!, index: index),
        const SizedBox(height: 16),
        CardTitle(
          title: news.title!,
        ),
        CardImage(
          urlImage: news.urlToImage,
        ),
        CardDescription(
          description: news.description,
        ),
        const SizedBox(height: 16),
        // Pasar la url de la noticia para más información
        CardButtons(url: news.url),
      ]),
    );
  }
}

// Widget que representa los botones de acción de la noticia
class CardButtons extends StatelessWidget {
  const CardButtons({super.key, this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // RawMaterialButton es un widget de nivel más bajo que permite personalizar completamente la apariencia y el comportamiento del botón. Proporciona opciones para especificar directamente el color de fondo, la forma, la elevación y el padding, entre otros.
        // Si necesitas un botón altamente personalizado o tienes requisitos específicos de diseño, puedes optar por RawMaterialButton
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        // Solo mostrar este botón si la noticia tiene asociada una url para visitarla en el sitio Web con un navegador
        if (url != null) ...[
          const SizedBox(width: 10),
          RawMaterialButton(
            onPressed: () async {
              await launchUrl(Uri.parse(url!), mode: LaunchMode.inAppWebView);
            },
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ]
      ],
    );
  }
}

// Widget que representa la descripción de la noticia
class CardDescription extends StatelessWidget {
  const CardDescription({super.key, this.description});
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(description ?? ''));
  }
}

// Widget que representa la imagen de la noticia
class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    this.urlImage,
  });

  // La URL que apunta a la imagen de la noticia
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        // Si existe una url, mostrar la imagen de noticia, caso contrario mostrar una imagen por defecto
        child: urlImage != null
            ? FadeInImage(
                placeholder: const AssetImage('assets/images/giphy.gif'),
                image: NetworkImage(urlImage!),
                fit: BoxFit.cover,
              )
            : const Image(image: AssetImage('assets/images/no-image.png')));
  }
}

// Widget que representa al titulo principal de la noticia
class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.title,
  });

  // El titulo principal de la noticia
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// Widget que representa la cabecera de la tarjeta referente a una noticia
class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.source,
    required this.index,
  });

  // La fuente de la noticia
  final String source;
  // Posición de la noticia en el listado de noticias
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        '${index + 1}. ',
        style: const TextStyle(color: Colors.blue),
      ),
      Text(source)
    ]);
  }
}
