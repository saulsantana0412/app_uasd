import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjectSelectionInfoCard extends StatelessWidget {

  final Subject subject;

  const SubjectSelectionInfoCard({super.key, required this.subject });

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.ligthBlue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Codigo", style: textTheme.labelMedium,),
              Text(subject.codigo, style: textTheme.bodyMedium,)
            ],
          ),
          Column(
            children: [
              Text("Horario", style: textTheme.labelMedium,),
              Text(subject.horario??"", style: textTheme.bodyMedium,)
            ],
          ),
          Column(
            children: [
              Text("Aula", style: textTheme.labelMedium,),
              Text(subject.aula, style: textTheme.bodyMedium,)
            ],
          ),
          CustomIconButton(
            icon: Icons.map_outlined, 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MapScreen(
                  coordenates: subject.ubicacion
                  );
              },));
            })
          // CustomIconButton(
          //   icon: Icons.check_box_outline_blank,
          //   icon2: Icons.check_box_outlined, 
          //   state: state,
          //   onPressed: onPressed)
        ],
      ),
    );
  }
}