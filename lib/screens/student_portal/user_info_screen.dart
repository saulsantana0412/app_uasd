import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/screens/student_portal/change_password_screen.dart';
import 'package:uasd_app/services/auth_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/custom_route_transition.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  User? user;

  Future<void> getUserInfo() async {
    user = await AuthService.userInfo();
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }


  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text("Mi Usuario", style: textTheme.titleMedium?.copyWith(color: AppColors.white),),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: user != null ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Información del usuario", style: textTheme.titleMedium),
            const SizedBox(height: 10,),
            Text("Nombre", style: textTheme.labelMedium),
            Text(user!.name!, style: textTheme.bodyLarge),
            const SizedBox(height: 10,),
            Text("Apellido", style: textTheme.labelMedium),
            Text(user!.lastname!, style: textTheme.bodyLarge),
            const SizedBox(height: 10,),
            Text("Usuario", style: textTheme.labelMedium),
            Text(user!.username, style: textTheme.bodyLarge),
            const SizedBox(height: 10,),
            Text("Correo Electrónico", style: textTheme.labelMedium),
            Text(user!.email!, style: textTheme.bodyLarge),
            const SizedBox(height: 20,),
            Divider(
              color: AppColors.blue,
            ),
            const SizedBox(height: 20,),
            Text("Acciones del usuario", style: textTheme.titleMedium),
            CustomTextButton(
              text: "- Cambiar Contraseña  ",
              color: AppColors.darkblue, 
              icon: Icons.edit_outlined, 
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen(),));
              }, ),
            const SizedBox(height: 20,),
            Divider(
              color: AppColors.blue,
            ),
            const SizedBox(height: 20,),
            SolidButton(text: "Cerrar Sesion", onPressed: (){
              ConfirmModal.show(
              context, 
              message: "Se cerrará tu sesión y volverás a la pantalla de inicio.", 
              question: "¿Quieres cerrar sesión?", 
              cancelButtonText: "No", 
              continueButtonText: "Si", 
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              });
            }
            )
          ]
        ): const SizedBox()
      ) 
    );
  }
}