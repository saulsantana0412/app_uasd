// import 'package:flutter/material.dart';
// import 'package:uasd_app/components/buttons/custom_text_button.dart';
// import 'package:uasd_app/components/buttons/icon_button_small.dart';
// import 'package:uasd_app/components/others/tag.dart';
// import 'package:uasd_app/utils/app_colors.dart';

// class RequestCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String state;
//   final String creationDate;
//   final String? responseDate;
//   final bool? response;
  
//   const RequestCard({super.key, required this.title, required this.description, required this.state, required this.creationDate, this.responseDate, this.response, });
  

//   @override
//   Widget build(BuildContext context) {

//     TextTheme textTheme = Theme.of(context).textTheme;

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(10),
//       decoration: const BoxDecoration(
//         color: AppColors.ligthGray
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title, style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
//                     if(description != null) SizedBox(height: 10,),
//                     if(description != null) Text(description!, style: textTheme.bodyMedium)
//                   ],
//                 ) 
//               ),
//               topIconButton ?? const SizedBox(width: 0,)
//             ],
//           ),
//           SizedBox(height: height ?? 10,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: Wrap(
//                   spacing: 10,
//                   // runSpacing: 10,
//                   children: [
//                     tag1 ?? const SizedBox(),
//                     if (tag2 != null) tag2!,
//                   ],
//                 ),
//               ),
//               bottomButton ?? const SizedBox(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }