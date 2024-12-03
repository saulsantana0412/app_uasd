import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final _currentPassCtrl = TextEditingController();
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
                const SizedBox(height: 30),
                const SizedBox(height: 10),

                TextInput(
                  label: "Contraseña Actual", 
                  controller: _currentPassCtrl,
                  icon: Icons.lock,
                  obscureText: true,
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
                        String currentPassCtrl = _currentPassCtrl.text.trim();
                        String newPass = _newPassCtrl.text.trim();
                        String confirmPass = _confirmPassCtrl.text.trim();

                        if(newPass == confirmPass){
                          
                            bool? result = await AuthService.changePassword(currentPassCtrl, newPass);
                            
                            if(result == true){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Su contraseña se ha cambiado correctamente"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            Navigator.pop(context);
                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.error, color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text("La contraseña actual es incorrecta"),
                                  ],
                                ),
                              backgroundColor: Colors.red,
                              showCloseIcon: true,
                              padding: EdgeInsets.all(10),
                              ), 
                            );
                          }      
                          } else{
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
                  text: "Cambiar Contraseña"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}