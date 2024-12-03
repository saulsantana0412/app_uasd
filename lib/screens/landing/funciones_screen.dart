import 'package:flutter/material.dart';

class FuncionesScreen extends StatelessWidget {
  const FuncionesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para el tema del texto
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView (
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Funciones", 
              style: textTheme.titleMedium,
              ),
             const SizedBox(height: 20),
             Image.network(
                'https://www.porlalinea.com.do/wp-content/uploads/2023/02/fachada-uasd-nota-240818-1024x768-1.jpg',
                width: 500,
                height: 280,
                fit: BoxFit.cover, 
              ),
              Text(
              "Para el cumplimiento de su misión, la Universidad tiene varias funciones, las cuales se desarrollan en procesos y actividades diversas. Las funciones principales son, según el Estatuto Orgánico (Arts. 5 y 6), la docencia, la investigación y la extensión.\n Cada una de estas funciones agrupa un conjunto de actividades en torno a una unidad específica y la totalidad de éstas expresan la misión. En síntesis el contenido axial y estructural de las funciones es el siguiente:", 
              style: textTheme.bodyMedium,
            ), 
            Text(
              "LA DOCENCIA", 
              style: textTheme.titleSmall,
            ),
            Text(
              "Es la función por la que se trasmite en el proceso académico los conocimientos, se dirige la aplicación de éstos a la realidad espacio/temporal y se desarrolla la actitud heurística. Se cumple a través de la Facultad y sus distintas expresiones (Escuela, Cátedra).Tiene como organismo central la Vicerrectoría Docente.", 
              style: textTheme.bodyMedium,
            ),
            Text(
              "LA INVESTIGACIÓN", 
              style: textTheme.titleSmall,
            ),
            Text(
              "Se orienta hacia la búsqueda de conocimientos nuevos y a la comprobación de los ya existentes. Su meta es la superación del acervo existente, el entrenamiento de los estudiantes/ profesionales en los métodos del conocimiento y actuar sobre los problemas sociales prioritarios. Las unidades estructurales encargadas de la política de esta función y las unidades de base a través de las cuales se cumple son las Facultades y los Institutos.", 
              style: textTheme.bodyMedium,
            ),
            Text(
              "LA ADMINISTRACIÓN", 
              style: textTheme.titleSmall,
            ),
            Text(
              "Es una función que se sustenta, entre otras, en forma de actividades específicas que sirven de apoyo a todo el proceso institucional. Su órgano central es la Vicerrectoría Administrativa, pero se manifiesta en todas las unidades docentes, docente/administrativas y administrativas.", 
              style: textTheme.bodyMedium,
            ),

          ],
        ),
      ),
    );
  }
}