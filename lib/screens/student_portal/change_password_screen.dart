import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/components/modals/error_snackbar.dart'; 
import 'package:uasd_app/components/modals/success_snackbar.dart'; 
import 'package:uasd_app/services/auth_service.dart'; 
import 'package:uasd_app/utils/app_colors.dart'; 

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Controladores para los campos de entrada de texto.
  final _currentPassCtrl = TextEditingController(); // Contraseña actual.
  final _newPassCtrl = TextEditingController(); // Nueva contraseña.
  final _confirmPassCtrl = TextEditingController(); // Confirmación de contraseña.

  // Clave global para el formulario, usada para validar los campos.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual.

    return Scaffold(
      backgroundColor: AppColors.white, // Fondo blanco para la pantalla.
      appBar: AppBar(
        // Barra de título de la pantalla.
        title: Text(
          "Restablecer Contraseña",
          style: textTheme.titleMedium?.copyWith(color: AppColors.white), // Estilo del texto.
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30), // Espaciado uniforme alrededor del contenido.
          child: Form(
            key: _formKey, // Asigna la clave global al formulario.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente.
              crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos horizontalmente.
              children: [
                // Logo de la UASD.
                Image.asset("assets/logo_uasd.png", width: double.infinity),
                const SizedBox(height: 30),

                // Campo para la contraseña actual.
                TextInput(
                  label: "Contraseña Actual",
                  controller: _currentPassCtrl,
                  icon: Icons.lock, // Icono de candado.
                  obscureText: true, // Oculta el texto para mayor seguridad.
                ),
                const SizedBox(height: 30),

                // Campo para la nueva contraseña.
                TextInput(
                  label: "Nueva Contraseña",
                  controller: _newPassCtrl,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // Campo para confirmar la nueva contraseña.
                TextInput(
                  label: "Confirmar Contraseña",
                  controller: _confirmPassCtrl,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // Botón para cambiar la contraseña.
                SolidButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Si los campos son válidos, se procesan los datos.
                      String currentPassCtrl = _currentPassCtrl.text.trim();
                      String newPass = _newPassCtrl.text.trim();
                      String confirmPass = _confirmPassCtrl.text.trim();

                      if (newPass == confirmPass) {
                        // Si las contraseñas coinciden.
                        bool? result = await AuthService.changePassword(currentPassCtrl, newPass);
                        
                        if (result == true) {
                          // Si el cambio de contraseña es exitoso.
                          SuccessSnackbar.show(context, "Su contraseña se ha cambiado correctamente.");
                          Navigator.pop(context); // Vuelve a la pantalla anterior.
                        } else {
                          // Si la contraseña actual es incorrecta.
                          ErrorSnackbar.show(context, "La contraseña actual es incorrecta.");
                        }
                      } else {
                        // Si las contraseñas no coinciden.
                        ErrorSnackbar.show(context, "Las contraseñas no coinciden.");
                      }
                    } else {
                      // Si el formulario está incompleto.
                      ErrorSnackbar.show(context, "Formulario incompleto.");
                    }
                  },
                  text: "Cambiar Contraseña", // Texto del botón.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
