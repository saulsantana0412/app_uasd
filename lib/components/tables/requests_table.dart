import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/utils/app_colors.dart';

class RequestsTable extends StatelessWidget {
  final List<Request> requests;
  final Function onPressed;

  const RequestsTable({super.key, required this.requests, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        decoration: const BoxDecoration(
          color: AppColors.white
        ),
        headingRowColor: const WidgetStatePropertyAll(AppColors.ligthBlue),
        headingRowHeight: 40,
        dividerThickness: 0,
        dataTextStyle: textTheme.bodyMedium,
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 4,
            color: Colors.transparent
          )
        ),
        columns: const [
          DataColumn(label: Text("Tipo")),
          DataColumn(label: Text("Fecha Solicitud")),
          DataColumn(label: Text("Estado")),
          DataColumn(label: Text(""))
        ],
        rows: requests.map((req) {
          return DataRow(
            cells: [
              DataCell(Text(req.tipo.toString())),
              DataCell(Text(req.fechaSolicitud.toString().split(".")[0].split(" ")[0])),
              DataCell(Text(req.estado)),
              DataCell(CustomIconButton(icon: 
                Icons.visibility_outlined,
                onPressed: (){
                  onPressed(req);
                })
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
