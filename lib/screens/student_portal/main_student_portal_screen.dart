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
  final String? name;
  final String initialScreen;

  const MainStudentPortalScreen({super.key, this.name, this.initialScreen = 'HomeScreen'});

  @override
  State<MainStudentPortalScreen> createState() => _MainStudentPortalScreenState();
}

class _MainStudentPortalScreenState extends State<MainStudentPortalScreen> {
  late String _currentScreen;
  String? _name = "";

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _currentScreen = widget.initialScreen;
  }

  Widget _getScreen(String screen) {
    switch (screen) {
      case 'NewsScreen':
        return const NewsScreen();
      case 'ClassSchedulesScreen':
        return const ClassSchedulesScreen();
      case 'SubjectPreselectionScreen':
        return const SubjectPreselectionScreen();
      case 'DebtsScreen':
        return const DebtsScreen();
      case 'RequestsScreen':
        return const RequestsScreen();
      case 'TasksScreen':
        return const TasksScreen();
      case 'EventsScreen':
        return const EventsScreen();
      case 'VideosScreen':
        return const VideosScreen();
      case 'AboutUsScreen':
        return const AboutUsScreen();
      case 'HomeScreen':
      default:
        return HomeScreen(name: _name, onOptionSelected: _onMenuItemSelected);
    }
  }

  void _onMenuItemSelected(String screen) {
    setState(() {
      _currentScreen = screen;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Portal de Estudiante",
          style: textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(CustomRouteTransition.slideTransition(const UserInfoScreen()));
              }, 
              icon: const Icon(Icons.person)
            ),
          ),
        ],
      ),
      
      drawer: StudentPortalMenu(
        currentScreen: _currentScreen,
        onMenuItemSelected: _onMenuItemSelected,
      ),
      body: _getScreen(_currentScreen),
    );
  }
}
