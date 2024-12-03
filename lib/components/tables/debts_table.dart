import 'package:flutter/material.dart';
import 'package:uasd_app/models/debt.dart';
import 'package:uasd_app/utils/app_colors.dart';

class DebtsTable extends StatelessWidget {
  final List<Debt> debts;

  const DebtsTable({super.key, required this.debts});

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
            color: AppColors.backgroundColor
          )
        ),
        columns: const [
          DataColumn( label: Text("Monto")),
          DataColumn( label: Text("Estado")),
        ],
        rows: debts.map((debt) {
          return DataRow(
            cells: [
              DataCell(Text("\$ ${debt.monto.toString()}"), ),
              DataCell(Text(debt.pagada? "Pagado": "Pendiente")),
            ],
          );
        }).toList(),
      ),
    );
  }
}
