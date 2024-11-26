import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/icon_button_small.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjectSelectionInfoCard extends StatelessWidget {

  final String section;
  final String schedule;
  final String places;
  final bool state;
  final VoidCallback onPressed;

  const SubjectSelectionInfoCard({super.key, required this.section, required this.schedule, required this.places, required this.state, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.ligthGray
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Seccion", style: textTheme.labelMedium,),
              Text(section, style: textTheme.bodyMedium,)
            ],
          ),
          Column(
            children: [
              Text("Horario", style: textTheme.labelMedium,),
              Text(schedule, style: textTheme.bodyMedium,)
            ],
          ),
          Column(
            children: [
              Text("Cupos", style: textTheme.labelMedium,),
              Text(places, style: textTheme.bodyMedium,)
            ],
          ),
          IconButtonSmall(
            icon: Icons.check_box_outline_blank,
            icon2: Icons.check_box_outlined, 
            state: state,
            onPressed: onPressed)
        ],
      ),
    );
  }
}