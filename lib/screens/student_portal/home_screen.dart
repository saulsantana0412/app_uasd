import 'package:flutter/material.dart';
import 'package:uasd_app/screens/student_portal/about_us_screen.dart';
import 'package:uasd_app/screens/student_portal/class_schedules_screen.dart';
import 'package:uasd_app/screens/student_portal/debts_screen.dart';
import 'package:uasd_app/screens/student_portal/events_screen.dart';
import 'package:uasd_app/screens/student_portal/news_screen.dart';
import 'package:uasd_app/screens/student_portal/requests_screen.dart';
import 'package:uasd_app/screens/student_portal/subject_preselection_screen.dart';
import 'package:uasd_app/screens/student_portal/tasks_screen.dart';
import 'package:uasd_app/screens/student_portal/videos_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {

  final String? name;

  const HomeScreen({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("¡Bienvenido, $name!", style: textTheme.titleLarge!.copyWith(fontSize: 30),),
            Text("Nos alegramos de tenerte de vuelta 😊", style: textTheme.bodyLarge),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(icon: Icons.newspaper_outlined, title: "Noticias", color: AppColors.blue, destination: NewsScreen(),),
                SizedBox(width: 40,),
                OptionContainer(icon: Icons.calendar_month, title: "Horarios", color: AppColors.blue, destination: ClassSchedulesScreen(),)
              ],
            ),
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(icon: Icons.check_box_outlined, title: "Preselección", color: AppColors.ligthBlue, destination: SubjectPreselectionScreen(),),
                SizedBox(width: 30,),
                OptionContainer(icon: Icons.credit_card, title: "Pagos", color: AppColors.ligthBlue, destination: DebtsScreen(),)
              ],
            ),
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(icon: Icons.mail_outlined, title: "Solicitudes", color: AppColors.white, destination: RequestsScreen(),),
                SizedBox(width: 30,),
                OptionContainer(icon: Icons.checklist, title: "Mis Tareas", color: AppColors.white, destination: TasksScreen(),)
              ],
            ),
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(icon: Icons.event, title: "Eventos", color: AppColors.ligthBlue, destination: EventsScreen(),),
                SizedBox(width: 30,),
                OptionContainer(icon: Icons.video_library_outlined, title: "Videos", color: AppColors.ligthBlue, destination: VideosScreen(),)
              ],
            ),
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionContainer(icon: Icons.info_outline_rounded, title: "Acerca de", color: AppColors.blue, destination: AboutUsScreen(),),
              ],
            )
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
  final Widget destination;

  const OptionContainer({super.key, required this.icon, required this.title, required this.color, required this.destination});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.of(context).size.width*.35,
      height: MediaQuery.of(context).size.width*.35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: AppColors.darkGray,),
          Text(title, style: textTheme.titleSmall,)
        ],
      ),
    );
  }
}