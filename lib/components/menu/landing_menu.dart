import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget que representa un menú de navegación lateral.
class LandingMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected; // Callback para manejar la selección del menú
  final String currentScreen; // Para identificar la pantalla actual

  const LandingMenu({
    super.key, 
    required this.onMenuItemSelected, 
    required this.currentScreen
  });

  @override
  State<LandingMenu> createState() => _LandingMenuState();
}

class _LandingMenuState extends State<LandingMenu> {
  String _selectedOption = ''; // Opción seleccionada en el menú

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.currentScreen; // Inicializa con la pantalla actual
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
            buildHeader(context), // Construye el encabezado con el logo
            const SizedBox(height: 10,),
            buildMenuItems(context), // Construye los ítems del menú
          ],
        ),
      ),
    );
  }

  /// Construye el encabezado con el logo de la universidad.
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white
      ),
      child: Image.asset("assets/logo_uasd.png", width: double.infinity,) // Logo de la UASD
    );
  }

  /// Construye los ítems del menú de navegación.
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
          icon: Icons.lens_blur_outlined,
          title: 'Filosofia',
          targetScreen: 'FilosofiaScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.account_tree_outlined,
          title: 'Funciones',
          targetScreen: 'FuncionesScreen',
          textTheme: textTheme,
        ),
        _buildMenuItem(
          context,
          icon: Icons.school_outlined,
          title: 'Facultades',
          targetScreen: 'FacultadesScreen',
          textTheme: textTheme,
        ),
      ],
    );
  }

  /// Construye un ítem de menú individual.
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String targetScreen,
    required TextTheme textTheme,
  }) {
    final bool isSelected = _selectedOption == targetScreen; // Verifica si este ítem está seleccionado

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.darkblue : null, // Resalta el ítem seleccionado
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? AppColors.white : AppColors.darkblue), // Cambia el color del icono si está seleccionado
        title: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            color: isSelected ? AppColors.white : AppColors.darkblue,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Resalta el texto si está seleccionado
          ),
        ),
        tileColor: isSelected ? AppColors.darkblue : null, // Resalta el fondo si está seleccionado
        onTap: () {
          setState(() {
            _selectedOption = targetScreen; // Actualiza la opción seleccionada
          });
          widget.onMenuItemSelected(targetScreen); // Llama al callback con la pantalla seleccionada
        },
      ),
    );
  }
}