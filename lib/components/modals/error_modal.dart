import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ErrorModal {

  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context,
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.error_outline, size: 50,), 
        iconColor: AppColors.red, 
        title: Text('Error', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,), 
        content: Text(message, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),  
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IntrinsicWidth(
            child: SolidButton(
              text: "Cerrar", 
              backgroundColor: AppColors.red,
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