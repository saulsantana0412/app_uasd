import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/screens/student_portal/change_password_screen.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  // Variable para almacenar la información del usuario
  User? user;

  // Método para obtener la información del usuario desde el servicio AuthService
  Future<void> getUserInfo() async {
    user = await AuthService.userInfo();
    setState(() {}); // Actualiza la UI después de obtener la información del usuario
  }

  @override
  void initState() {
    super.initState();
    getUserInfo(); // Llama al método para cargar la información del usuario cuando la pantalla se inicializa
  }

  @override
  Widget build(BuildContext context) {

    // Obtenemos el tema de texto para usar en los widgets
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Fondo de la pantalla
      appBar: AppBar(
        title: Text("Mi Usuario", style: textTheme.titleMedium?.copyWith(color: AppColors.white)), // Título de la app bar
      ),
      body: Container(
        width: double.infinity, // El contenedor ocupa todo el ancho
        padding: const EdgeInsets.all(20), // Padding alrededor del contenido
        child: user != null // Si los datos del usuario están disponibles, se muestra la información
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Información del usuario", style: textTheme.titleMedium), // Título de la sección de información
            const SizedBox(height: 10),
            Text("Nombre", style: textTheme.labelMedium), // Etiqueta para el nombre
            Text(user!.name!, style: textTheme.bodyLarge), // Muestra el nombre del usuario
            const SizedBox(height: 10),
            Text("Apellido", style: textTheme.labelMedium), // Etiqueta para el apellido
            Text(user!.lastname!, style: textTheme.bodyLarge), // Muestra el apellido del usuario
            const SizedBox(height: 10),
            Text("Usuario", style: textTheme.labelMedium), // Etiqueta para el nombre de usuario
            Text(user!.username, style: textTheme.bodyLarge), // Muestra el nombre de usuario
            const SizedBox(height: 10),
            Text("Correo Electrónico", style: textTheme.labelMedium), // Etiqueta para el correo
            Text(user!.email!, style: textTheme.bodyLarge), // Muestra el correo electrónico del usuario
            const SizedBox(height: 20),
            const Divider(color: AppColors.blue), // Línea divisoria
            const SizedBox(height: 20),
            Text("Acciones del usuario", style: textTheme.titleMedium), // Título de la sección de acciones
            CustomTextButton(
              text: "- Cambiar Contraseña  ", // Texto del botón para cambiar la contraseña
              color: AppColors.darkblue, 
              icon: Icons.edit_outlined, // Ícono del botón
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen(),)); // Navegar a la pantalla para cambiar la contraseña
              },
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.blue), // Línea divisoria
            const SizedBox(height: 20),
            SolidButton(
              text: "Cerrar Sesion", // Texto del botón para cerrar sesión
              onPressed: () {
                // Mostrar un modal de confirmación para cerrar sesión
                ConfirmModal.show(
                  context, 
                  message: "Se cerrará tu sesión y volverás a la pantalla de inicio.", 
                  question: "¿Quieres cerrar sesión?", 
                  cancelButtonText: "No", 
                  continueButtonText: "Si", 
                  onPressed: () {
                    // Si el usuario confirma, se realiza la acción de cerrar sesión y se vuelve a la pantalla de inicio
                    Navigator.pop(context); // Cierra el modal de confirmación
                    Navigator.pop(context); // Cierra la pantalla de informacion de usuario (esta)
                    Navigator.pop(context); // Cierra la pantalla principal
                    Navigator.pop(context); // Cierra la pantalla del login
                  }
                );
              }
            )
          ]
        )
        : const SizedBox() // Si los datos del usuario no están disponibles, no muestra nada
      ) 
    );
  }
}
