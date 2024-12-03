// import 'package:flutter/material.dart';
// import 'package:uasd_app/screens/landing/facultades_screen.dart';
// import 'package:uasd_app/screens/landing/filosofia_screen.dart';
// import 'package:uasd_app/screens/landing/funciones_screen.dart';
// import 'package:uasd_app/screens/landing/home_screen.dart';
// import 'package:uasd_app/utils/app_colors.dart';

// class LandingMenu extends StatefulWidget {
//   final String currentScreen; // Para identificar la pantalla actual

//   const LandingMenu({super.key, required this.currentScreen});

//   @override
//   State<LandingMenu> createState() => _LandingMenuState();
// }

// class _LandingMenuState extends State<LandingMenu> {
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
//             icon: Icons.lens_blur_outlined,
//             title: 'Filosofia',
//             targetScreen: 'FilosafiaScreen',
//             destination: const FilosafiaScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.account_tree_outlined,
//             title: 'Funciones',
//             targetScreen: 'FuncionesScreen',
//             destination: const FuncionesScreen(),
//             textTheme: textTheme,
//           ),
//           _buildMenuItem(
//             context,
//             icon: Icons.school_outlined,
//             title: 'Facultades',
//             targetScreen: 'FacultadesScreen',
//             destination: const FacultadesScreen(),
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

class LandingMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected; // Callback para manejar la selección del menú
  final String currentScreen; // Para identificar la pantalla actual

  const LandingMenu({super.key, required this.onMenuItemSelected, required this.currentScreen});

  @override
  State<LandingMenu> createState() => _LandingMenuState();
}

class _LandingMenuState extends State<LandingMenu> {
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

