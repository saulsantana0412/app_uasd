import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/screens/student_portal/home_screen.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Database connection
  Future<User?> validateUser({required String username, required String password}) async{
    return await AuthService.login(username, password);
  }

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("lib/assets/logo.png", width: 150),
                const SizedBox(height: 30),
                Text("Inicio de Sesión", style: textTheme.headlineLarge,),
                const SizedBox(height: 30),
                TextInput(
                  label: "Usuario", 
                  controller: _usernameCtrl,
                  icon: Icons.person,
                ),
                const SizedBox(height: 30,),
                TextInput(
                  label: "Contraseña", 
                  controller: _passwordCtrl,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30,),

                //  Login Button
                SolidButton(
                  onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                    
                        String username = _usernameCtrl.text.trim();
                        String password = _passwordCtrl.text.trim();

                        User? user = await AuthService.login(username, password);

                        if (user != null) {
                          _usernameCtrl.clear();
                          _passwordCtrl.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        } else {
                          // Mensaje para usuario o contraseña incorrecta
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: const Row(
                                children: [
                                  Icon(Icons.error, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text("Usuario o contraseña incorrecta"),
                                ],
                              ),
                            backgroundColor: Colors.red,
                            showCloseIcon: true,
                            padding: EdgeInsets.all(10),
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
                  text: "Iniciar Sesion"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
