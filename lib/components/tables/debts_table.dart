import 'package:flutter/material.dart';
import 'package:uasd_app/models/debt.dart';
import 'package:uasd_app/utils/app_colors.dart';

class DebtsTable extends StatelessWidget {
  final List<Debt> debts; // Lista de deudas a mostrar

  const DebtsTable({super.key, required this.debts}); // Constructor que recibe la lista de deudas

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto de la aplicación

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Permite desplazamiento horizontal en caso de que la tabla sea muy ancha
      child: DataTable(
        decoration: const BoxDecoration(
          color: AppColors.white, // Fondo blanco para la tabla
        ),
        headingRowColor: const WidgetStatePropertyAll(AppColors.ligthBlue), // Color del encabezado
        headingRowHeight: 40, // Altura de la fila del encabezado
        dividerThickness: 0, // Sin grosor de líneas divisorias
        dataTextStyle: textTheme.bodyMedium, 
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 4, 
            color: AppColors.backgroundColor, 
          ),
        ),
        columns: const [
          DataColumn(label: Text("Monto")), // Columna para el monto
          DataColumn(label: Text("Estado")), // Columna para el estado
        ],
        rows: debts.map((debt) { // Mapea las deudas a filas
          return DataRow(
            cells: [
              DataCell(Text("\$ ${debt.monto.toString()}")), // Celda con el monto de la deuda
              DataCell(Text(debt.pagada ? "Pagado" : "Pendiente")), // Celda con el estado de la deuda
            ],
          );
        }).toList(),
      ),
    );
  }
}