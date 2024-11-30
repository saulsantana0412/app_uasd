import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? color;

  const CustomTextButton({super.key, required this.onPressed, required this.text, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.labelMedium?.copyWith(color: color),
            ),
            if(icon != null) Icon(icon, color: color,)
          ],
        ),
      ),
    );
  }
}