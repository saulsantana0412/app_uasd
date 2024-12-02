import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _newPassCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>() ;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  TextTheme textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Restablecer Contraseña", style: textTheme.titleMedium?.copyWith(color: AppColors.white),),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo_uasd.png", width: double.infinity,),
                // Image.asset("assets/logo.png", width: 200,),
                const SizedBox(height: 30),
                // Text("Reiniciar Contraseña", style: textTheme.titleLarge,),
                const SizedBox(height: 10),
                // Text("Para poder restablecer su contraseña favor completar los siguientes campos:", style: textTheme.bodyLarge,),
                // const SizedBox(height: 30),
                TextInput(
                  label: "Usuario", 
                  controller: _usernameCtrl,
                  icon: Icons.person,
                ),
                const SizedBox(height: 30,),
                TextInput(
                  label: "Correo Electronico", 
                  controller: _emailCtrl,
                  icon: Icons.mail_outline_rounded,
                ),
                const SizedBox(height: 30,),
                TextInput(
                  label: "Nueva Contraseña", 
                  controller: _newPassCtrl,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30,),
                TextInput(
                  label: "Confirmar Contraseña", 
                  controller: _confirmPassCtrl,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30,),
                //  Login Button
                SolidButton(
                  onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                    
                        String username = _usernameCtrl.text.trim();
                        String email = _emailCtrl.text.trim();
                        String newPass = _newPassCtrl.text.trim();
                        String confirmPass = _confirmPassCtrl.text.trim();


                        if(newPass == confirmPass){
                          
                          bool? result = await AuthService.resetPassword(username, email);
                          
                          if (result == true) {
                            
                            bool? result = await AuthService.changePassword("${username}@", newPass);
                            
                            if(result == true){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Su contraseña se ha reestablecido correctamente"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            Navigator.pop(context);
                            }

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: const Row(
                                  children: [
                                    Icon(Icons.error, color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text("Usuario o correo incorrecto"),
                                  ],
                                ),
                              backgroundColor: Colors.red,
                              showCloseIcon: true,
                              padding: EdgeInsets.all(10),
                              ), 
                            );
                          }                          
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Las contraseñas no coinciden"),
                                backgroundColor: Colors.red,
                              ),
                            );
                        }
                      } else {
                        // Mensaje para formulario incompleto
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Formulario incompleto"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }, 
                  text: "Restablecer Contraseña"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}