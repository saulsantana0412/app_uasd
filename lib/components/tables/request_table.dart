import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/services/request_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class RequestTable extends StatelessWidget {
  final List<Request> requests;
  final VoidCallback update;

  const RequestTable({super.key, required this.requests, required this.update});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return Column(
          children: [
            _buildRow("Tipo", Text(request.tipo, style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            _buildRow("Descripcion", Text(request.descripcion, style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            _buildRow("Estado", Text(request.estado, style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            _buildRow("Fecha Solicitud", Text(request.fechaSolicitud.toString().split(".")[0].split("T")[0], style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            _buildRow("Respondida", Text(request.respuesta == null ? "No" : "Sí", style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            _buildRow("Fecha Respuesta", Text(request.fechaRespuesta == null ? "-" : request.fechaRespuesta.toString().split(".")[0], style: textTheme.bodyMedium,), textTheme),
            middleBorder(),
            request.respuesta == null ?
            _buildRow("Acciones", 
            CustomTextButton(
              onPressed: () async {
                await RequestService.cancelRequest(request.id);
                print(request.id);
                update();
                // print(request.id);
              }, 
              text: "Cancelar Solicitud  ", 
              color: AppColors.red,), 
              textTheme)
            : const SizedBox(),
            SizedBox(height: 20,)
          ]
        ); 
      },
    );
  }

  Widget _buildRow(String fieldName, Widget value, TextTheme textTheme) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 150,
            color: AppColors.blue,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            child: Text(
              fieldName,
              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)
            ),
          ),
          const SizedBox(width: 4,),
          Expanded(
            child: Container(
              color: AppColors.ligthBlue,
              padding: const EdgeInsets.all(8.0),
              child: value
            ),
          ),
        ],
      ),
    );
  }

  Widget middleBorder(){
    return const Divider(
      height: 4,
      indent: 0, 
      endIndent: 0, 
      color: Colors.transparent, 
    );
  }
}
