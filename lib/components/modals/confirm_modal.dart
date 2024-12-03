import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/outline_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ConfirmModal {

  static void show(BuildContext context, {
    required String message,
    required String question,
    required String cancelButtonText,
    required String continueButtonText,
    required VoidCallback onPressed,
  }) { 
    showDialog( 
      context: context,
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.question_mark, size: 50,), 
        iconColor: AppColors.darkblue, 
        title: Text('Atención', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,), 
        content: IntrinsicHeight(
          child: Column(
            children: [
              Text(message, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Text(question, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
            ],
          ),
        ),  
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IntrinsicWidth(
            child: Row(
              children: [
                OutlineButton(
                  text: cancelButtonText, 
                  color: AppColors.darkblue,
                  onPressed: (){
                    Navigator.pop(context);
                  }
                ),
                const SizedBox(width: 10,),
                SolidButton(
                  text: continueButtonText, 
                  backgroundColor: AppColors.darkblue,
                  onPressed: onPressed)
              ],
            ),
          )
        ], 
      ), 
    ); 
  } 
}