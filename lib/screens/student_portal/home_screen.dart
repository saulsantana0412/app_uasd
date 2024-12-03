import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/screens/student_portal/main_student_portal_screen.dart';

class HomeScreen extends StatelessWidget {
  final String? name;
  final Function(String) onOptionSelected;

  const HomeScreen({super.key, this.name, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

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

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido, $name!",
              style: textTheme.titleLarge!.copyWith(fontSize: 30),
            ),
            Text(
              "Nos alegramos de tenerte de vuelta 😊",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.newspaper_outlined,
                  title: "Noticias",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('NewsScreen'),
                ),
                const SizedBox(width: 40),
                OptionContainer(
                  icon: Icons.calendar_month,
                  title: "Horarios",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('ClassSchedulesScreen'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.check_box_outlined,
                  title: "Preselección",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('SubjectPreselectionScreen'),
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.credit_card,
                  title: "Pagos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('DebtsScreen'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.mail_outlined,
                  title: "Solicitudes",
                  color: AppColors.white,
                  onTap: () => navigateToScreen('RequestsScreen'),
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.checklist,
                  title: "Mis Tareas",
                  color: AppColors.white,
                  onTap: () => navigateToScreen('TasksScreen'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.event,
                  title: "Eventos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('EventsScreen'),
                ),
                const SizedBox(width: 30),
                OptionContainer(
                  icon: Icons.video_library_outlined,
                  title: "Videos",
                  color: AppColors.ligthBlue,
                  onTap: () => navigateToScreen('VideosScreen'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(
                  icon: Icons.info_outline_rounded,
                  title: "Acerca de",
                  color: AppColors.blue,
                  onTap: () => navigateToScreen('AboutUsScreen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const OptionContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        height: MediaQuery.of(context).size.width * .35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: AppColors.darkGray),
            Text(title, style: textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
