import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema de texto para estilos consistentes
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Acerca de los Desarrolladores",
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildDeveloperCard(
                textTheme,
                name: "Eliezer Mejía",
                matricula: "2022-2127",
                bio:
                    "Estudiante apasionado por el desarrollo de software. Enfocado en crear soluciones tecnológicas prácticas e innovadoras.",
                imagePath: 'assets/eliezer.png',
              ),
              const SizedBox(height: 20),
              _buildDeveloperCard(
                textTheme,
                name: "Saul Santana",
                matricula: "2022-2097",
                bio:
                    "Desarrollador interesado en Flutter y tecnologías modernas. Mi meta es mejorar continuamente y transformar ideas en realidad.",
                imagePath: 'assets/saul.png',
              ),
              const SizedBox(height: 30),
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

  // Método para construir las tarjetas de los desarrolladores
  Widget _buildDeveloperCard(
    TextTheme textTheme, {
    required String name,
    required String matricula,
    required String bio,
    required String imagePath,
  }) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
            color: AppColors.yellow,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                imagePath,

                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text( name,
                  style: textTheme.titleLarge?.copyWith(color: AppColors.darkblue)
                ),
                Text(
                  "$matricula",
                  style: textTheme.labelMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  bio,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}