import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FacultadesScreen extends StatelessWidget {
  const FacultadesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para el tema del texto
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("UASD"),
      // ),
      // drawer: const LandingMenu(currentScreen: 'FacultadesScreen',),
      body: SingleChildScrollView (
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Facultades", 
              style: textTheme.titleMedium,
              ),
              Text(
              "Estas son las diferentes facultades que se enuentran en nustra universidad:", 
               style: textTheme.bodyMedium,
            ),
             SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-HUMANIDADES.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Humanidades", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-CIENCIAS.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias", 
              style: textTheme.titleSmall,
            ),
             SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-ECONOMIA.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias Economicas y Sociales", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-JURIDICA.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias Jurídicas y Políticas", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-INGENIERIA.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ingenieria y Arquitectura", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-SALUD.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias de la Salúd", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-VETERINARIA.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias Agronómicas y Veterinarias", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-ARTES.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Artes", 
              style: textTheme.titleSmall,
            ), 
            SizedBox(height: 20),
             SvgPicture.network(
                'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-EDUCACION.svg',
                width: 300,
                height: 150,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            Text(
              "Facultad de Ciencias de la Educación", 
              style: textTheme.titleSmall,
            ), 

          ],
        ),
      ),
    );
  }
}