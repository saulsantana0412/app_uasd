import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/screens/student_portal/main_student_portal_screen.dart';

class HomeScreen extends StatelessWidget {
  final String? name;
  final Function(String) onOptionSelected;

  const HomeScreen({super.key, this.name, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Estilo de texto de la aplicación.

    // Método para navegar a la pantalla correspondiente según la opción seleccionada.
    void navigateToScreen(String screen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainStudentPortalScreen(
            name: name,
            initialScreen: screen,
          ),
        ),
      );
    }

    return SingleChildScrollView( // Permite que el contenido se desplace si no cabe en la pantalla.
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Fondo de la pantalla.
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bienvenida al estudiante.
            Text(
              "¡Bienvenido, $name!",
              style: textTheme.titleLarge!.copyWith(fontSize: 30), // Estilo del texto de bienvenida.
            ),
            Text(
              "Nos alegramos de tenerte de vuelta 😊",
              style: textTheme.bodyLarge, // Estilo del mensaje de bienvenida.
            ),
            const SizedBox(height: 20), // Espaciado entre los elementos.
            
            // Primer fila de opciones.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.newspaper_outlined,
                  title: "Noticias",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('NewsScreen'), // Acción al seleccionar la opción.
                ),
                const SizedBox(width: 40),
                OptionContainer(
                  icon: Icons.calendar_month,
                  title: "Horarios",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('ClassSchedulesScreen'), // Acción al seleccionar la opción.
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Segunda fila de opciones.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.check_box_outlined,
                  title: "Preselección",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('SubjectPreselectionScreen'), // Acción al seleccionar la opción.
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.credit_card,
                  title: "Pagos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('DebtsScreen'), // Acción al seleccionar la opción.
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Tercera fila de opciones.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.mail_outlined,
                  title: "Solicitudes",
                  color: AppColors.white,
                  onTap: () => navigateToScreen('RequestsScreen'), // Acción al seleccionar la opción.
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.checklist,
                  title: "Mis Tareas",
                  color: AppColors.white,
                  onTap: () => navigateToScreen('TasksScreen'), // Acción al seleccionar la opción.
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Cuarta fila de opciones.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.event,
                  title: "Eventos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('EventsScreen'), // Acción al seleccionar la opción.
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.video_library_outlined,
                  title: "Videos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('VideosScreen'), // Acción al seleccionar la opción.
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Quinta fila de opciones (opción única).
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.info_outline_rounded,
                  title: "Acerca de",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('AboutUsScreen'), // Acción al seleccionar la opción.
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable para las opciones del menú.
class OptionContainer extends StatelessWidget {
  final IconData icon; // Icono de la opción.
  final String title; // Título de la opción.
  final Color color; // Color de fondo de la opción.
  final VoidCallback onTap; // Acción al hacer clic en la opción.

  const OptionContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Estilo de texto de la aplicación.

    return GestureDetector(
      onTap: onTap, // Detecta el toque en la opción y ejecuta la acción correspondiente.
      child: Container(
        width: MediaQuery.of(context).size.width * .35, // Tamaño de la opción (35% del ancho de la pantalla).
        height: MediaQuery.of(context).size.width * .35, // Tamaño de la opción (35% del ancho de la pantalla).
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color, // Color de fondo de la opción.
          borderRadius: BorderRadius.circular(10), // Bordes redondeados.
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido dentro de la opción.
          children: [
            Icon(icon, size: 30, color: AppColors.darkGray), // Icono de la opción.
            Text(title, style: textTheme.titleSmall), // Título de la opción.
          ],
        ),
      ),
    );
  }
}
