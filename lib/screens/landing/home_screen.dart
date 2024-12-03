import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Para el tema del texto
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("UASD"),
      //   actions: [
      //     SolidButton(text: "Iniciar Sesion", onPressed: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      //     })
      //   ],
      // ),
      // drawer: const LandingMenu(currentScreen: 'HomeScreen',),
      body: SingleChildScrollView (
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Historia", 
              style: textTheme.titleMedium,
              ),
            Text(
              "La Universidad de Santo Domingo fue creada mediante la Bula In Apostolatus Culmine, expedida el 28 de octubre de 1538 por el Papa Paulo III, la cual elevó a esa categoría el Estudio General que los dominicos regenteaban desde el 1518, en Santo Domingo, sede virreinal de la colonización y el más viejo establecimiento colonial del Nuevo Mundo.La Universidad de Alcalá de Henares fue su modelo y como tal fue porta-estandarte de las ideas renacentistas que surgían del mundo medieval, del que emergía la España de los días de la conquista.La naciente Universidad inició sus enseñanzas organizadas en cuatro Facultades: Medicina, Derecho, Teología y Artes, conforme a las normas establecidas en la época para las instituciones similares de la metrópoli.", 
              style: textTheme.bodyMedium,
            ),
             const SizedBox(height: 20),
             Image.network(
                'https://uasd.edu.do/wp-content/uploads/UASD-10-768x549.jpg',
                width: 500,
                height: 250,
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ), 
            const SizedBox(height: 20),
            Text(
              "Misión", 
              style: textTheme.titleMedium,
            ),
            Text(
              "Su Misión es formar críticamente profesionales, investigadores y técnicos en las ciencias, las humanidades y las artes necesarias y eficientes para coadyuvar a las transformaciones que demanda el desarrollo nacional sostenible, así como difundir los ideales de la cultura de paz, progreso, justicia social, equidad de género y respeto a los derechos humanos, a fin de contribuir a la formación de una conciencia colectiva basada en valores.", 
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 20), 
            Text(
              "Vision", 
              style: textTheme.titleMedium,
            ),
            Text(
              "La Universidad tiene como Visión ser una institución de excelencia y liderazgo académico, gestionada con eficiencia y acreditada nacional e internacionalmente; con un personal docente, investigador, extensionistas y egresados de alta calificación; creadora de conocimientos científicos y nuevas tecnologías, y reconocida por su contribución al desarrollo humano con equidad y hacia una sociedad democrática y solidaria.", 
              style: textTheme.bodyMedium,
            ),
             const SizedBox(height: 20),
              Text(
                "Valores",
                style: textTheme.titleMedium,
              ),
              Text(
                "La Universidad está orientada hacia el respeto y la defensa de la dignidad humana y se sustenta en los siguientes valores:",
                style: textTheme.bodyMedium,
              ),
              Text(
                "a) Solidaridad\n"
                "b) Transparencia\n"
                "c) Verdad\n"
                "d) Igualdad\n"
                "e) Libertad\n"
                "f) Equidad\n"
                "g) Tolerancia\n"
                "h) Responsabilidad\n"
                "i) Convivencia\n"
                "j) Paz",
                textAlign: TextAlign.left,
                style: textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}