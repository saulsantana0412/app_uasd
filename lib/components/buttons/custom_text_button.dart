import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomTextButton({super.key, required this.onPressed, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.labelMedium,
            ),
            if(icon != null) Icon(icon)
          ],
        ),
      ),
    );
  }
}