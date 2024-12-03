import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class OutlineButton extends StatelessWidget {
  final String text; 
  final Color? color;
  final VoidCallback onPressed;

  const OutlineButton({super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: textTheme.labelMedium,
        foregroundColor: color ?? AppColors.darkGray,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide( color: color ?? AppColors.darkGray, width: 2)
        ),
      ), 
      child: Text(text)
    );
  }
}