import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema de texto para estilos consistentes
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Acerca de los Desarrolladores",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildDeveloperCard(
                textTheme,
                name: "Eliezer Mejía",
                matricula: "2022-2127",
                bio:
                    "Estudiante apasionado por el desarrollo de software. Enfocado en crear soluciones tecnológicas prácticas e innovadoras.",
                imagePath: 'assets/eliezer.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperCard(
                textTheme,
                name: "Saúl Santana",
                matricula: "2022-2097",
                bio:
                    "Desarrollador interesado en Flutter y tecnologías modernas. Mi meta es mejorar continuamente y transformar ideas en realidad.",
                imagePath: 'assets/eliezer.jpg',
              ),
              const SizedBox(height: 30),
              Text(
                "Gracias por usar nuestra aplicación. ¡Esperamos que te sea útil y educativa!",
                style: textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir las tarjetas de los desarrolladores
  Widget _buildDeveloperCard(
    TextTheme textTheme, {
    required String name,
    required String matricula,
    required String bio,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Matrícula: $matricula",
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 10),
          Text(
            bio,
            style: textTheme.bodySmall?.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}