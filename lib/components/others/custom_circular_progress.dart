import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget personalizado para mostrar un indicador de progreso circular.
class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20,), 
          CircularProgressIndicator(
            color: AppColors.blue, // Color personalizado del indicador de progreso
          ),
          SizedBox(height: 20,), 
        ],
      ),
    );
  }
}