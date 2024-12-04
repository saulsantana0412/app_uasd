import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FacultadesScreen extends StatelessWidget {
  const FacultadesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para obtener los estilos de texto definidos en el tema.
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView (
        // Permite desplazarse si el contenido es demasiado grande para la pantalla.
        padding: const EdgeInsets.all(20), // Definir el margen de la pantalla.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos en el centro.
          children: [
            // Título de la pantalla
            Text(
              "Facultades", 
              style: textTheme.titleMedium,
            ),
            // Descripción breve sobre las facultades
            Text(
              "Estas son las diferentes facultades que se encuentran en nuestra universidad:", 
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 20), // Espacio entre los elementos.

            // Facultad de Humanidades
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-HUMANIDADES.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
            ),
            Text(
              "Facultad de Humanidades", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-CIENCIAS.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ciencias", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias Económicas y Sociales
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-ECONOMIA.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ciencias Económicas y Sociales", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias Jurídicas y Políticas
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-JURIDICA.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ciencias Jurídicas y Políticas", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ingeniería y Arquitectura
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-INGENIERIA.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ingeniería y Arquitectura", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias de la Salud
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-SALUD.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ciencias de la Salud", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias Agronómicas y Veterinarias
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-VETERINARIA.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Ciencias Agronómicas y Veterinarias", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Artes
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-ARTES.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              "Facultad de Artes", 
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 20),

            // Facultad de Ciencias de la Educación
            SvgPicture.network(
              'https://uasd.edu.do/wp-content/uploads/2022/11/LOGO-EDUCACION.svg',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
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
