import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/components/modals/error_snackbar.dart';
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/screens/login/reset_password_screen.dart';
import 'package:uasd_app/screens/student_portal/main_student_portal_screen.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/services/token_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/custom_route_transition.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Método para validar el inicio de sesión llamando al servicio de autenticación.
  Future<User?> validateUser({required String username, required String password}) async {
    return await AuthService.login(username, password);
  }

  // Controladores para manejar las entradas del formulario.
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  // Llave global para manejar el estado del formulario.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Limpieza de controladores al destruir la pantalla.
    _usernameCtrl.clear();
    _passwordCtrl.clear();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey, // Asignación de la llave al formulario.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logotipo de la aplicación.
                Image.asset("assets/logo_uasd.png", width: double.infinity),
                const SizedBox(height: 30),

                // Campo de entrada para el nombre de usuario.
                TextInput(
                  label: "Usuario",
                  controller: _usernameCtrl,
                  icon: Icons.person,
                ),
                const SizedBox(height: 30),

                // Campo de entrada para la contraseña.
                TextInput(
                  label: "Contraseña",
                  controller: _passwordCtrl,
                  icon: Icons.lock,
                  obscureText: true, // Ocultar texto por motivos de seguridad.
                ),
                const SizedBox(height: 10),

                // Botón para redirigir a la pantalla de recuperación de contraseña.
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: "¿Olvidó su contraseña?",
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomRouteTransition.slideTransition(
                            const ResetPasswordScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 30),

                // Botón de inicio de sesión.
                SolidButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Recuperar valores de los campos de entrada.
                      String username = _usernameCtrl.text.trim();
                      String password = _passwordCtrl.text.trim();

                      // Validar las credenciales del usuario.
                      User? user = await AuthService.login(username, password);

                      if (user != null) {
                        // Limpiar campos de entrada y almacenar el token.
                        _usernameCtrl.clear();
                        _passwordCtrl.clear();
                        TokenService.setToken(user.authToken);

                        // Navegar al portal principal del estudiante.
                        Navigator.of(context).push(
                          CustomRouteTransition.slideTransition(
                            MainStudentPortalScreen(name: user.name),
                          ),
                        );
                      } else {
                        // Mostrar mensaje de error si las credenciales son incorrectas.
                        ErrorSnackbar.show(context, "Usuario o Contraseña incorrecto.");
                      }
                    } else {
                      // Mostrar mensaje de error si el formulario no está completo.
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ErrorSnackbar.show(context, "Formulario incompleto.");
                    }
                  },
                  text: "Iniciar Sesion",
                ),
                const SizedBox(height: 10),

                // Botón para redirigir a una página externa.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      text: "¡Estudia con Nosotros!",
                      onPressed: () {
                        ConfirmModal.show(
                          context,
                          message: "Se te redigirá a una pagina externa.",
                          question: "¿Quieres continuar?",
                          cancelButtonText: "No",
                          continueButtonText: "Si",
                          onPressed: () {
                            Navigator.pop(context); // Cerrar el modal.
                            Launch.url("https://app.uasd.edu.do/admision_rne/");
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
