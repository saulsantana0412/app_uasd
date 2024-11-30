import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Portal de Estudiante"),
        // backgroundColor: Colors.transparent,
        // titleTextStyle: textTheme.titleLarge,
        // foregroundColor: AppColors.darkGray,
      ),
      drawer: const StudentPortalMenu(currentScreen: 'HomeScreen',),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bienvenido Saul!", style: textTheme.titleLarge!.copyWith(fontSize: 30),),
              Text("Nos alegramos de tenerte de vuelta 😊", style: textTheme.bodyLarge),
              SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionContainer(icon: Icons.newspaper_outlined, title: "Noticias", color: AppColors.ligthBlue, destination: NewsScreen(),),
                  SizedBox(width: 40,),
                  OptionContainer(icon: Icons.calendar_month, title: "Horarios", color: AppColors.blue, destination: ClassSchedulesScreen(),)
                ],
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionContainer(icon: Icons.check_box_outlined, title: "Preselección", color: AppColors.blue, destination: SubjectPreselectionScreen(),),
                  SizedBox(width: 30,),
                  OptionContainer(icon: Icons.credit_card, title: "Pagos", color: AppColors.white, destination: DebtsScreen(),)
                ],
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionContainer(icon: Icons.mail_outlined, title: "Solicitudes", color: AppColors.white, destination: RequestsScreen(),),
                  SizedBox(width: 30,),
                  OptionContainer(icon: Icons.checklist, title: "Mis Tareas", color: AppColors.ligthBlue, destination: TasksScreen(),)
                ],
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionContainer(icon: Icons.event, title: "Eventos", color: AppColors.blue, destination: EventsScreen(),),
                  SizedBox(width: 30,),
                  OptionContainer(icon: Icons.video_library_outlined, title: "Videos", color: AppColors.white, destination: VideosScreen(),)
                ],
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionContainer(icon: Icons.info_outline_rounded, title: "Acerca de", color: AppColors.ligthBlue, destination: AboutUsScreen(),),
                ],
              )
            ],
          ),
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