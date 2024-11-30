import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/cards/subject_selection_info_card.dart';
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjetsSelectionCardsList extends StatelessWidget {

  final Subject subject;
  final VoidCallback onPressed;

  const SubjetsSelectionCardsList({super.key, required this.subject, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.blue
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject.nombre, 
                style: textTheme.titleMedium,),
              CustomIconButton(
                icon: Icons.check_box_outline_blank,
                icon2: Icons.check_box_outlined, 
                state: subject.confirmada,
                onPressed: onPressed
              ),
            ],
          ),
        ),
        SubjectSelectionInfoCard(
          subject: subject,
        )
      ]
    );
  }
}