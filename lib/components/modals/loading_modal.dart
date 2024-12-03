import 'package:flutter/material.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/utils/app_colors.dart';

class LoadingModal {

  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.hourglass_empty, size: 50,), 
        iconColor: AppColors.blue, 
        title: Text('Procesando', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,), 
        content: Column( 
          mainAxisSize: MainAxisSize.min, 
          children: [ 
            Text(message, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,), 
            const CustomCircularProgress(), 
          ], 
        ), 
      ), 
    ); 
  } 
}
