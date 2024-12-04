import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema de texto para estilos consistentes en toda la pantalla.
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20), // Espaciado alrededor del contenido.
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Fondo personalizado.
        ),
        child: SingleChildScrollView(
          // Permite desplazar el contenido si supera el tamaño de la pantalla.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido horizontalmente.
            children: [
              // Título de la sección.
              Text(
                "Acerca de los Desarrolladores",
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // Separación entre el título y el contenido.

              // Tarjeta para el primer desarrollador.
              _buildDeveloperCard(
                textTheme,
                name: "Eliezer Mejía", // Nombre.
                matricula: "2022-2127", // Matrícula.
                bio:
                    "Estudiante apasionado por el desarrollo de software. Enfocado en crear soluciones tecnológicas prácticas e innovadoras.",
                imagePath: 'assets/eliezer.png', // Ruta de la imagen.
              ),
              const SizedBox(height: 20), // Separación entre tarjetas.

              // Tarjeta para el segundo desarrollador.
              _buildDeveloperCard(
                textTheme,
                name: "Saul Santana",
                matricula: "2022-2097",
                bio:
                    "Desarrollador interesado en Flutter y tecnologías modernas. Mi meta es mejorar continuamente y transformar ideas en realidad.",
                imagePath: 'assets/saul.png',
              ),
              const SizedBox(height: 30),

              // Mensaje final de agradecimiento.
              Text(
                "Gracias por usar nuestra aplicación. ¡Esperamos que te sea útil!",
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir las tarjetas de los desarrolladores.
  Widget _buildDeveloperCard(
    TextTheme textTheme, {
    required String name, // Nombre del desarrollador.
    required String matricula, // Matrícula del desarrollador.
    required String bio, // Biografía del desarrollador.
    required String imagePath, // Ruta de la imagen del desarrollador.
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white, // Fondo blanco de la tarjeta.
        borderRadius: BorderRadius.circular(10), // Bordes redondeados.
        boxShadow: [
          // Sombra para dar un efecto de elevación.
          BoxShadow(
            color: AppColors.blue.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagen de encabezado de la tarjeta.
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: AppColors.yellow, // Fondo amarillo para el encabezado.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10),
              ), // Bordes superiores redondeados.
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath, // Imagen del desarrollador.
                width: double.infinity, // Ocupa todo el ancho disponible.
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio.
              ),
            ),
          ),
          // Información textual de la tarjeta.
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Nombre del desarrollador.
                Text(
                  name,
                  style: textTheme.titleLarge?.copyWith(color: AppColors.darkblue),
                ),
                // Matrícula del desarrollador.
                Text(
                  "$matricula",
                  style: textTheme.labelMedium,
                ),
                const SizedBox(height: 10), // Separación entre texto.
                // Biografía del desarrollador.
                Text(
                  bio,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center, // Centrado horizontal.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
