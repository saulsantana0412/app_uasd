import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/event.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

class EventCard extends StatelessWidget {
  
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05),
            blurRadius: 10
        )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event.titulo, style: textTheme.titleMedium,),
              CustomIconButton(
                  icon: Icons.location_on_outlined, 
                  onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MapScreen(
                        coordenates: event.coordenadas); 
                      }
                    ));
                  }
                ),
            ],
          ),
          const SizedBox(height: 5,),
          Text(event.descripcion, style: textTheme.bodyMedium,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Fecha Evento : ", style: textTheme.labelMedium,),
              Text(event.fechaEvento.toString().split(".")[0], style: textTheme.bodyMedium,)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Lugar: ", style: textTheme.labelMedium,),
              Text(event.lugar.toString().split(".")[0], style: textTheme.bodyMedium,)
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ); 
    
  }
}