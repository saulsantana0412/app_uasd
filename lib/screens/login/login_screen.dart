import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/screens/login/reset_password_screen.dart';
import 'package:uasd_app/screens/student_portal/main_student_portal_screen.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/services/token_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/custom_route_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
  void dispose() {
    super.dispose();
    _usernameCtrl.clear();
    _passwordCtrl.clear();
    _passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {

  // TextTheme textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      backgroundColor: AppColors.white,
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
                // const SizedBox(height: 30),
                // Text("Inicio de Sesión", style: textTheme.titleLarge,),
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
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: "¿Olvidó su contraseña?", 
                      onPressed: () {
                        Navigator.of(context).push(CustomRouteTransition.slideTransition(const ResetPasswordScreen()));
                      },
                    )
                  ],
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
                          TokenService.setToken(user.authToken);

                          Navigator.of(context).push(
                            CustomRouteTransition.slideTransition(
                              MainStudentPortalScreen(name: user.name,)
                              )
                            );
                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => MainStudentPortalScreen()),
                          // );
                        } else {
                          // Mensaje para usuario o contraseña incorrecta
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Row(
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
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                ),
                const SizedBox(height: 20,),
                // Text("¿Olvidó su contraseña?", style: textTheme.labelMedium,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
