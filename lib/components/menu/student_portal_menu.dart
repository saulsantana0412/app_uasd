// import 'package:flutter/material.dart';
// import 'package:uasd_app/screens/student_portal/about_us_screen.dart';
// import 'package:uasd_app/screens/student_portal/class_schedules_screen.dart';
// import 'package:uasd_app/screens/student_portal/debts_screen.dart';
// import 'package:uasd_app/screens/student_portal/events_screen.dart';
// import 'package:uasd_app/screens/student_portal/home_screen.dart';
// import 'package:uasd_app/screens/student_portal/news_screen.dart';
// import 'package:uasd_app/screens/student_portal/requests_screen.dart';
// import 'package:uasd_app/screens/student_portal/subject_preselection_screen.dart';
// import 'package:uasd_app/screens/student_portal/tasks_screen.dart';
// import 'package:uasd_app/screens/student_portal/videos_screen.dart';
// import 'package:uasd_app/utils/app_colors.dart';

// class StudentPortalMenu extends StatefulWidget {
//   final String currentScreen; // Para identificar la pantalla actual

//   const StudentPortalMenu({super.key, required this.currentScreen});

//   @override
//   State<StudentPortalMenu> createState() => _StudentPortalMenuState();
// }

// class _StudentPortalMenuState extends State<StudentPortalMenu> {
//   String _selectedOption = '';

//   @override
//   void initState() {
//     super.initState();
//     _selectedOption = widget.currentScreen; // Inicializar con la pantalla actual
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppColors.white,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 30,),
//             buildHeader(context),
//             SizedBox(height: 10,),
//             buildMenuItems(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildHeader(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       decoration: const BoxDecoration(
//         color: AppColors.white
//       ),
//       child: Image.asset("assets/logo_uasd.png", width: double.infinity,)
//     );
//   }

//   Widget buildMenuItems(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;

//     return Container(
//       child: Wrap(
//         runSpacing: 16,
//         children: [
//           _buildMenuItem(
//             context,
//             icon: Icons.home_outlined,
//             title: 'Inicio',
//             targetScreen: 'HomeScreen',
//             destination: const HomeScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.newspaper_outlined,
//             title: 'Noticias',
//             targetScreen: 'NewsScreen',
//             destination: const NewsScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.calendar_month,
//             title: 'Horarios',
//             targetScreen: 'ClassSchedulesScreen',
//             destination: const ClassSchedulesScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.check_box_outlined,
//             title: 'Preselección',
//             targetScreen: 'SubjectPreselectionScreen',
//             destination: const SubjectPreselectionScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.credit_card,
//             title: 'Pagos',
//             targetScreen: 'DebtsScreen',
//             destination: const DebtsScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.mail_outlined,
//             title: 'Solicitudes',
//             targetScreen: 'RequestsScreen',
//             destination: const RequestsScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.checklist,
//             title: 'Mis Tareas',
//             targetScreen: 'TasksScreen',
//             destination: const TasksScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.event,
//             title: 'Eventos',
//             targetScreen: 'EventsScreen',
//             destination: const EventsScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.video_library_outlined,
//             title: 'Videos',
//             targetScreen: 'VideosScreen',
//             destination: const VideosScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.info_outline_rounded,
//             title: 'Acerca de',
//             targetScreen: 'AboutUsScreen',
//             destination: const AboutUsScreen(),
//             textTheme: textTheme,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuItem(
//     BuildContext context, {
//     required IconData icon,
//     required String title,
//     required String targetScreen,
//     required Widget destination,
//     required TextTheme textTheme,
//   }) {
//     final bool isSelected = _selectedOption == targetScreen;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: isSelected ? AppColors.darkblue : null,
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? AppColors.white : AppColors.darkblue),
//         title: Text(
//           title,
//           style: textTheme.bodyLarge?.copyWith(
//             color: isSelected ? AppColors.white : AppColors.darkblue,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//         tileColor: isSelected ? AppColors.darkblue : null,
//         onTap: () {
//           setState(() {
//             _selectedOption = targetScreen;
//           });
//           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => destination));
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class StudentPortalMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected; // Callback para manejar la selección del menú
  final String currentScreen; // Para identificar la pantalla actual

  const StudentPortalMenu({super.key, required this.onMenuItemSelected, required this.currentScreen});

  @override
  State<StudentPortalMenu> createState() => _StudentPortalMenuState();
}

class _StudentPortalMenuState extends State<StudentPortalMenu> {
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.currentScreen; // Inicializar con la pantalla actual
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30,),
            buildHeader(context),
            const SizedBox(height: 10,),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white
      ),
      child: Image.asset("assets/logo_uasd.png", width: double.infinity,)
    );
  }

  Widget buildMenuItems(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Wrap(
      runSpacing: 16,
      children: [
        _buildMenuItem(
          context,
          icon: Icons.home_outlined,
          title: 'Inicio',
          targetScreen: 'HomeScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.newspaper_outlined,
          title: 'Noticias',
          targetScreen: 'NewsScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.calendar_month,
          title: 'Horarios',
          targetScreen: 'ClassSchedulesScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.check_box_outlined,
          title: 'Preselección',
          targetScreen: 'SubjectPreselectionScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.credit_card,
          title: 'Pagos',
          targetScreen: 'DebtsScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.mail_outlined,
          title: 'Solicitudes',
          targetScreen: 'RequestsScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.checklist,
          title: 'Mis Tareas',
          targetScreen: 'TasksScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.event,
          title: 'Eventos',
          targetScreen: 'EventsScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.video_library_outlined,
          title: 'Videos',
          targetScreen: 'VideosScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.info_outline_rounded,
          title: 'Acerca de',
          targetScreen: 'AboutUsScreen',
          textTheme: textTheme,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String targetScreen,
    required TextTheme textTheme,
  }) {
    final bool isSelected = _selectedOption == targetScreen;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.darkblue : null,
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? AppColors.white : AppColors.darkblue),
        title: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            color: isSelected ? AppColors.white : AppColors.darkblue,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        tileColor: isSelected ? AppColors.darkblue : null,
        onTap: () {
          setState(() {
            _selectedOption = targetScreen;
          });
          widget.onMenuItemSelected(targetScreen); // Llama al callback
        },
      ),
    );
  }
}
