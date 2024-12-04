import 'package:flutter/material.dart';

class FilosafiaScreen extends StatelessWidget {
  const FilosafiaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para obtener los estilos de texto definidos en el tema.
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        // Habilita el desplazamiento si el contenido excede el tamaño de la pantalla.
        padding: const EdgeInsets.all(20), // Define el margen de todos los lados.
        child: Column(
          children: [
            // Título principal de la pantalla.
            Text(
              "Filosofía",
              style: textTheme.titleMedium,
            ),
            // Descripción detallada del modelo educativo y filosofía de la universidad.
            Text(
              """
La Universidad es una institución que une a profesores, estudiantes y  servidores de apoyo a la labor académica, con el propósito de dar cumplimiento a la misión y  la visión universitarias.La Universidad Autónoma de Santo Domingo es un patrimonio social público de alto interés estratégico que forma parte del Sistema Nacional de Educación Superior Estatal, integrada por la Sede Central, Recintos, Centros y Subcentros Universitarios, esparcidos en la geografía del país y en el exterior, con centralización normativa y descentralización operativa e interdependientes, que se gestiona bajo el régimen de autonomía con responsabilidad.
\nEl modelo educativo institucional de la Universidad Autónoma de Santo Domingo está sustentado en la docencia, la investigación y la extensión; busca fortalecer el desarrollo de una conciencia crítica, el pensamiento reflexivo y creativo, así como las demás funciones y actividades que se requieren para el cumplimiento de su misión.""",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 20), // Espacio entre el texto y la imagen.
            // Imagen representativa de la universidad.
            Image.network(
              'https://listindiario.com/files/main_image/uploads/2021/02/03/64324d9df00f5.jpeg',
              width: 500,
              height: 250,
              fit: BoxFit.cover, // Ajusta cómo se muestra la imagen.
            ),
          ],
        ),
      ),
    );
  }
}
