// import 'package:flutter/material.dart';
// import 'package:uasd_app/utils/app_colors.dart';

// class InfoTable extends StatelessWidget {
//   final List<String> columns;
//   final List<List<String>> rows;

//   InfoTable({required this.columns, required this.rows});

//   @override
//   Widget build(BuildContext context) {

//     TextTheme textTheme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         decoration: const BoxDecoration(
//           color: AppColors.ligthBlue
//         ),
//         headingRowColor: WidgetStatePropertyAll(AppColors.blue),
//         headingRowHeight: 40,
//         dividerThickness: 0,
//         dataTextStyle: textTheme.bodyMedium,
//         border: TableBorder(
//           horizontalInside: BorderSide(
//             width: 4,
//             color: AppColors.white
//           )
//         ),
//         columns: columns.map(
//           (column) => DataColumn(
//             label: Text(column, style: textTheme.labelLarge,)
//           )).toList(),
//         rows: rows.map((row) {
//           return DataRow(
//             cells: row.map((cell) => DataCell(Text(cell))).toList(),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
