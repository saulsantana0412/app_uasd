import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/utils/app_colors.dart';

class RequestsTable extends StatelessWidget {
  final List<Request> requests; // Lista de solicitudes
  final Function onPressed; // Función para manejar el evento de presionar el ícono

  const RequestsTable({super.key, required this.requests, required this.onPressed}); // Constructor

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto de la aplicación

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Permite desplazamiento horizontal si la tabla es ancha
      child: DataTable(
        decoration: const BoxDecoration(
          color: AppColors.white, // Fondo blanco de la tabla
        ),
        headingRowColor: const WidgetStatePropertyAll(AppColors.ligthBlue), // Color de fila de encabezado
        headingRowHeight: 40, // Altura de la fila de encabezado
        dividerThickness: 0, // Sin líneas divisorias
        dataTextStyle: textTheme.bodyMedium, 
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 4, 
            color: Colors.transparent, 
          ),
        ),
        columns: const [
          DataColumn(label: Text("Tipo")), // Columna para el tipo de solicitud
          DataColumn(label: Text("Fecha Solicitud")), // Columna para la fecha de solicitud
          DataColumn(label: Text("Estado")), // Columna para el estado de la solicitud
          DataColumn(label: Text("")), // Columna vacía para el ícono de visibilidad
        ],
        rows: requests.map((req) { // Mapea las solicitudes a filas de la tabla
          return DataRow(
            cells: [
              DataCell(Text(req.tipo.toString())), // Muestra el tipo de solicitud
              DataCell(Text(req.fechaSolicitud.toString().split(".")[0].split(" ")[0])), // Muestra la fecha de solicitud
              DataCell(Text(req.estado)), // Muestra el estado de la solicitud
              DataCell(CustomIconButton( // Ícono para ver detalles
                icon: Icons.visibility_outlined,
                onPressed: () {
                  onPressed(req); // Llama la función cuando se presiona el ícono
                },
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}