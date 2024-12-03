import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SuccessModal {

  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context, 
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.check_circle_outline_outlined, size: 50,), 
        iconColor: AppColors.green, 
        title: Text('¡Éxito!', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,), 
        content: Text(message, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),  
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IntrinsicWidth(
            child: SolidButton(
              text: "Cerrar", 
              backgroundColor: AppColors.green,
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          )
        ],
      ), 
    ); 
  } 
}