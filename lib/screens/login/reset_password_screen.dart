import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/components/modals/error_snackbar.dart';
import 'package:uasd_app/components/modals/success_snackbar.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Controladores para manejar las entradas del usuario.
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  // Llave para validar el formulario.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Tema de texto para estilos consistentes.
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Restablecer Contraseña",
          style: textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          // Permite desplazarse si el contenido supera el tamaño de la pantalla.
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey, // Asociar el formulario a su clave global.
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

                // Campo de entrada para el correo electrónico.
                TextInput(
                  label: "Correo Electronico",
                  controller: _emailCtrl,
                  icon: Icons.mail_outline_rounded,
                ),
                const SizedBox(height: 30),

                // Botón para restablecer la contraseña.
                SolidButton(
                  onPressed: () async {
                    // Validar el formulario.
                    if (_formKey.currentState!.validate()) {
                      String username = _usernameCtrl.text.trim();
                      String email = _emailCtrl.text.trim();

                      // Llamar al servicio para restablecer la contraseña.
                      bool? result = await AuthService.resetPassword(username, email);

                      if (result == true) {
                        // Mostrar un mensaje de éxito y regresar a la pantalla anterior.
                        SuccessSnackbar.show(context, "Su contraseña se ha reestablecido correctamente");
                        Navigator.pop(context);
                      } else {
                        // Mostrar un mensaje de error si el usuario o correo son incorrectos.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.error, color: Colors.white),
                                SizedBox(width: 10),
                                Text("Usuario o correo incorrecto"),
                              ],
                            ),
                            backgroundColor: Colors.red,
                            showCloseIcon: true,
                            padding: EdgeInsets.all(10),
                          ),
                        );
                      }
                    } else {
                      // Mostrar un mensaje si el formulario no está completo.
                      ErrorSnackbar.show(context, "Formulario incompleto.");
                    }
                  },
                  text: "Restablecer Contraseña", // Texto del botón.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
