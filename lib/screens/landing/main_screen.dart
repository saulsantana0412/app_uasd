import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para el tema del texto
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UASD"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Historia", 
              style: textTheme.titleMedium,),
            Text(
              "La Universidad de Santo Domingo fue creada mediante la Bula In Apostolatus Culmine, expedida el 28 de octubre de 1538 por el Papa Paulo III, la cual elevó a esa categoría el Estudio General que los dominicos regenteaban desde el 1518, en Santo Domingo, sede virreinal de la colonización y el más viejo establecimiento colonial del Nuevo Mundo.", 
              style: textTheme.bodyMedium,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                // Para colores se usa la clase AppColors
                color: AppColors.darkblue
              ),
            )
          ],
        ),
      ),
    );
  }
}