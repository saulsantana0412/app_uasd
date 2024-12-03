import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class TaskCard extends StatelessWidget {
  
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: !task.completada ? AppColors.blue : AppColors.yellow
              ),
              child: Container(
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(!task.completada ? "Pendiente" : "Completada", 
                      style: textTheme.labelLarge,),
                    const SizedBox(width: 5,),
                    Icon(
                      !task.completada ? Icons.remove_circle_outline : Icons.check_circle_outline_outlined, 
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.titulo, style: textTheme.titleMedium,),
                  const SizedBox(height: 5,),
                  Text(task.descripcion, style: textTheme.bodyMedium,),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.ligthBlue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fecha de Venc. : ", style: textTheme.labelMedium,),
                  Text(task.fechaVencimiento.toString().split(".")[0], style: textTheme.bodyMedium,)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SolidButton(
              text: !task.completada ? "Agregar Entrega" : "Ver Entrega", 
              onPressed: (){
                ConfirmModal.show(
                  context, 
                  message: "Se te redigirá a una pagina externa.", 
                  question: "¿Quieres continuar?", 
                  cancelButtonText: "No", 
                  continueButtonText: "Si", 
                  onPressed: (){
                    Navigator.pop(context);
                    Launch.url("https://soft.uasd.edu.do/UASDVirtualGateway/");
                  }
                );
              }
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    ); 
    
  }
}