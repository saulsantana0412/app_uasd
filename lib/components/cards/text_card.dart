import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/others/tag.dart';
import 'package:uasd_app/utils/app_colors.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Tag? tag1;
  final Tag? tag2;
  final CustomIconButton? topIconButton;
  final CustomTextButton? bottomButton;
  final double? height;
  
  const TextCard({super.key, required this.title, this.subtitle, this.tag1, this.tag2, this.topIconButton, this.bottomButton, this.height});
  

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05),
            // spreadRadius: 1,
            blurRadius: 10
          )
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
                    if(subtitle != null) SizedBox(height: 5 ,),
                    if(subtitle != null) Text(subtitle!, style: textTheme.bodyMedium)
                  ],
                ) 
              ),
              topIconButton ?? const SizedBox(width: 0,)
            ],
          ),
          SizedBox(height: height ?? 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10,
                  // runSpacing: 10,
                  children: [
                    tag1 ?? const SizedBox(),
                    if (tag2 != null) tag2!,
                  ],
                ),
              ),
              bottomButton == null ? const SizedBox() : const SizedBox(width: 20,),
              bottomButton ?? const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}