// import 'package:flutter/material.dart';
// import 'package:uasd_app/components/buttons/custom_text_button.dart';
// import 'package:uasd_app/utils/app_colors.dart';

// class TitleCard extends StatelessWidget {
//   final String title;
//   final int credits;
//   final VoidCallback onPressed;

//   const TitleCard({super.key, required this.title, required this.credits, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {

//     TextTheme textTheme = Theme.of(context).textTheme;

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(10),
//       decoration: const BoxDecoration(
//         color: AppColors.gray
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: textTheme.titleMedium,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("${credits.toString()} creditos", style: textTheme.bodyMedium,),
//               CustomTextButton(text: "Ver horarios", onPressed: onPressed)
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }