import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/landing_menu.dart';
import 'package:uasd_app/screens/landing/facultades_screen.dart';
import 'package:uasd_app/screens/landing/filosofia_screen.dart';
import 'package:uasd_app/screens/landing/funciones_screen.dart';
import 'package:uasd_app/screens/landing/home_screen.dart';
import 'package:uasd_app/screens/login/login_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/custom_route_transition.dart';

class MainLandingScreen extends StatefulWidget {
  const MainLandingScreen({super.key});

  @override
  State<MainLandingScreen> createState() => _MainLandingScreenState();
}

class _MainLandingScreenState extends State<MainLandingScreen> {
  String _currentScreen = 'HomeScreen';

  Widget _getScreen(String screen) {
    switch (screen) {
      case 'FilosofiaScreen':
        return const FilosafiaScreen();
      case 'FuncionesScreen':
        return const FuncionesScreen();
      case 'FacultadesScreen':
        return const FacultadesScreen();
      case 'HomeScreen':
      default:
        return const HomeScreen();
    }
  }

  void _onMenuItemSelected(String screen) {
    setState(() {
      _currentScreen = screen;
    });
    Navigator.of(context).pop(); // Cierra el Drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UASD"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(CustomRouteTransition.slideTransition(const LoginScreen()));
              }, 
              icon: Icon(Icons.login)
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(
          color: AppColors.white
        ),
      ),
      drawer: LandingMenu(
        currentScreen: _currentScreen,
        onMenuItemSelected: _onMenuItemSelected,
      ),
      body: _getScreen(_currentScreen),
    );
  }
}