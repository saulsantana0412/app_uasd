import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class Tag extends StatelessWidget {

  final String text;

  const Tag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        text,
        style: theme.textTheme.labelMedium,),
    );
  }
}