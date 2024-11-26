import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class OutlineButton extends StatelessWidget {
  final String text; 
  final VoidCallback onPressed;

  const OutlineButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: textTheme.labelMedium,
        foregroundColor: AppColors.darkGray,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide( color: AppColors.darkGray, width: 2)
        ),
      ), 
      child: Text(text)
    );
  }
}