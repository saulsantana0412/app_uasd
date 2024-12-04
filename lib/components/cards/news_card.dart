import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button_small.dart';
import 'package:uasd_app/models/new.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget que muestra una tarjeta con la información de una noticia.
class NewsCard extends StatelessWidget {
  final New newArticle; // El artículo de noticia que se va a mostrar.

  const NewsCard({super.key, required this.newArticle});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto del contexto.
    
    return Container(
      width: double.infinity, // El contenedor ocupa todo el ancho disponible.
      decoration: BoxDecoration(
        color: AppColors.white, 
        borderRadius: const BorderRadius.all(Radius.circular(10)), 
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05), // Sombra sutil en la tarjeta.
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), // Redondeo de la parte superior izquierda.
              topRight: Radius.circular(10), // Redondeo de la parte superior derecha.
            ),
            child: Stack(
              children: [
                Image.network(newArticle.img, fit: BoxFit.cover), // Imagen de la noticia.
                CustomIconButtonSmall(
                  url: newArticle.url, // Botón para interactuar con la noticia.
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10), // Espaciado interno en el texto.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alineación del texto.
              children: [
                Text(newArticle.date, style: textTheme.bodySmall), // Muestra la fecha de la noticia.
                const SizedBox(height: 5),
                Text(newArticle.title, style: textTheme.labelLarge), // Muestra el título de la noticia.
              ],
            ),
          ),
        ],
      ),
    );
  }
}