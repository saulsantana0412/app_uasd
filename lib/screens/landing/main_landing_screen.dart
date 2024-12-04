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
  // Variable para rastrear la pantalla actual.
  String _currentScreen = 'HomeScreen';

  // Método para obtener la pantalla correspondiente según el nombre.
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

  // Método para manejar la selección de elementos del menú.
  void _onMenuItemSelected(String screen) {
    setState(() {
      _currentScreen = screen;
    });
    Navigator.of(context).pop(); // Cierra el Drawer.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UASD"),
        actions: [
          // Botón de acceso al inicio de sesión.
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CustomRouteTransition.slideTransition(const LoginScreen()),
                );
              },
              icon: const Icon(Icons.login),
            ),
          ),
        ],
        actionsIconTheme: const IconThemeData(
          color: AppColors.white, // Define el color de los íconos de acción.
        ),
      ),
      drawer: LandingMenu(
        currentScreen: _currentScreen, // Pantalla actual.
        onMenuItemSelected: _onMenuItemSelected, // Callback al seleccionar un elemento del menú.
      ),
      body: _getScreen(_currentScreen), // Muestra la pantalla actual.
    );
  }
}
