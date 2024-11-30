import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SolidButton extends StatelessWidget {
  final String text; 
  final Color? backgroundColor;
  final VoidCallback onPressed;

  const SolidButton({super.key, required this.text, required this.onPressed, this.backgroundColor});

  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            textStyle: theme.textTheme.labelMedium,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: backgroundColor??AppColors.darkblue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ), 
          child: Text(text)
        ),
      ] 
    );
  }
}