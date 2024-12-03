import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjetsSelectionCard extends StatelessWidget {

  final Subject subject;
  final VoidCallback onPressed;

  const SubjetsSelectionCard({super.key, required this.subject, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.ligthBlue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            boxShadow: [
            BoxShadow(
              color: AppColors.darkGray.withOpacity(.05),
              blurRadius: 10
            )]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject.nombre, 
                style: textTheme.titleSmall,),
              CustomIconButton(
                icon: Icons.check_box_outline_blank,
                icon2: Icons.check_box_outlined, 
                state: subject.confirmada,
                onPressed: onPressed
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
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
                  Text(subject.horario??"", style: textTheme.bodyMedium, softWrap: true,)
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
            ],
          ),
        )
      ]
    );
  }
}