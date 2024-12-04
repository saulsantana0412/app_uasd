import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
import 'package:uasd_app/screens/student_portal/about_us_screen.dart'; 
import 'package:uasd_app/screens/student_portal/class_schedules_screen.dart'; 
import 'package:uasd_app/screens/student_portal/debts_screen.dart'; 
import 'package:uasd_app/screens/student_portal/events_screen.dart'; 
import 'package:uasd_app/screens/student_portal/home_screen.dart'; 
import 'package:uasd_app/screens/student_portal/news_screen.dart'; 
import 'package:uasd_app/screens/student_portal/requests_screen.dart'; 
import 'package:uasd_app/screens/student_portal/subject_preselection_screen.dart'; 
import 'package:uasd_app/screens/student_portal/tasks_screen.dart'; 
import 'package:uasd_app/screens/student_portal/user_info_screen.dart'; 
import 'package:uasd_app/screens/student_portal/videos_screen.dart'; 
import 'package:uasd_app/utils/app_colors.dart'; 
import 'package:uasd_app/utils/methods/custom_route_transition.dart';

class MainStudentPortalScreen extends StatefulWidget {
  final String? name; // Nombre del estudiante.
  final String initialScreen; // Pantalla inicial del portal, por defecto es 'HomeScreen'.

  const MainStudentPortalScreen({super.key, this.name, this.initialScreen = 'HomeScreen'});

  @override
  State<MainStudentPortalScreen> createState() => _MainStudentPortalScreenState(); // Estado de la pantalla principal.
}

class _MainStudentPortalScreenState extends State<MainStudentPortalScreen> {
  late String _currentScreen; // Pantalla que se está mostrando actualmente.
  String? _name = ""; // Nombre del estudiante.

  @override
  void initState() {
    super.initState();
    _name = widget.name; // Inicializa el nombre con el que se pasa al constructor.
    _currentScreen = widget.initialScreen; // Establece la pantalla inicial.
  }

  // Método que devuelve la pantalla correspondiente según el valor de 'screen'.
  Widget _getScreen(String screen) {
    switch (screen) {
      case 'NewsScreen': return const NewsScreen(); // Pantalla de noticias.
      case 'ClassSchedulesScreen': return const ClassSchedulesScreen(); // Pantalla de horarios de clases.
      case 'SubjectPreselectionScreen': return const SubjectPreselectionScreen(); // Pantalla de preselección de asignaturas.
      case 'DebtsScreen': return const DebtsScreen(); // Pantalla de deudas.
      case 'RequestsScreen': return const RequestsScreen(); // Pantalla de solicitudes.
      case 'TasksScreen': return const TasksScreen(); // Pantalla de tareas.
      case 'EventsScreen': return const EventsScreen(); // Pantalla de eventos.
      case 'VideosScreen': return const VideosScreen(); // Pantalla de videos.
      case 'AboutUsScreen': return const AboutUsScreen(); // Pantalla de "Sobre Nosotros".
      case 'HomeScreen': 
      default: return HomeScreen(name: _name, onOptionSelected: _onMenuItemSelected); // Pantalla principal por defecto.
    }
  }

  // Método que actualiza la pantalla actual cuando se selecciona una opción en el menú lateral.
  void _onMenuItemSelected(String screen) {
    setState(() {
      _currentScreen = screen; // Actualiza la pantalla actual.
    });
    Navigator.of(context).pop(); // Cierra el menú lateral.
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Fondo del portal de estudiante.
      appBar: AppBar(
        title: Text(
          "Portal de Estudiante",
          style: textTheme.titleMedium?.copyWith(color: AppColors.white), // Título de la aplicación.
        ),
        actions: [
          // Botón para acceder a la pantalla de información del usuario.
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(CustomRouteTransition.slideTransition(const UserInfoScreen())); // Transición a la pantalla de información del usuario.
              }, 
              icon: const Icon(Icons.person) // Icono de perfil.
            ),
          ),
        ],
      ),
      
      drawer: StudentPortalMenu(
        currentScreen: _currentScreen, // Pantalla actual seleccionada.
        onMenuItemSelected: _onMenuItemSelected, // Función que maneja la selección de elementos del menú.
      ),
      body: _getScreen(_currentScreen), // Muestra la pantalla seleccionada.
    );
  }
}
