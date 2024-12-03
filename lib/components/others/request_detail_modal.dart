import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/services/request_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class RequestDetailModal extends StatelessWidget {
  final Request request;

  const RequestDetailModal({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Solicitud #${request.id}", style: textTheme.titleMedium,), 
          const SizedBox(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                BuildRow(fieldName: "Tipo", value: request.tipo),
                BuildRow(fieldName: "Descripcion", value: request.descripcion),
                BuildRow(fieldName: "Estado", value: request.estado),
                BuildRow(fieldName: "Tipo", value: request.fechaSolicitud.toString().split(".")[0].split("T")[0]),
                BuildRow(fieldName: "Respuesta", value: request.respuesta == null ? "-" : request.respuesta!),
                BuildRow(fieldName: "Fecha Respuesta", value: request.fechaRespuesta == null ? "-" : request.fechaRespuesta.toString().split(".")[0]),
              ]
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              request.respuesta == null ? 
              SolidButton(
                onPressed: () {
                  bool? result; Future<void> deleteRequest() async { 
                    result = await RequestService.cancelRequest(request.id); 
                    Navigator.pop(context); // Cierra el ConfirmModal después de la solicitud 
                    if (result == true) { 
                      Navigator.pop(context, true); // Cierra el modal principal y devuelve true 
                    } else { 
                      Navigator.pop(context, false);
                    }
                  } // Cierra el modal principal y devuelve false }
                  ConfirmModal.show(
                    context, 
                    message: "Se cancelará permanentemente esta solicitud.", 
                    question: "¿Estas seguro?", 
                    cancelButtonText: "No", 
                    continueButtonText: "Si", 
                    onPressed: (){
                      deleteRequest();
                    }
                  );
                }, 
                text: "Cancelar Solicitud", 
                backgroundColor: AppColors.red,)
              : const SizedBox(),
            ],
          )
          
        ],
      ),
    ); 
  }
}

class BuildRow extends StatelessWidget {

  final String fieldName;
  final String value;

  const BuildRow({super.key, required this.fieldName, required this.value});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 150,
              color: AppColors.ligthBlue,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text(
                fieldName,
                style: textTheme.labelMedium
              ),
            ),
            const SizedBox(width: 3,),
            Expanded(
              child: Container(
                color: AppColors.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Text(value, style: textTheme.bodyMedium,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}