import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/icon_button_small.dart';
import 'package:uasd_app/components/others/tag.dart';
import 'package:uasd_app/utils/app_colors.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Tag? tag1;
  final Tag? tag2;
  final IconButtonSmall? topIconButton;
  final CustomTextButton? bottomButton;
  final double? height;
  
  const TextCard({super.key, required this.title, this.subtitle, this.tag1, this.tag2, this.topIconButton, this.bottomButton, this.height});
  

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.ligthGray
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
                    if(subtitle != null) SizedBox(height: 10,),
                    if(subtitle != null) Text(subtitle!, style: textTheme.bodyMedium)
                  ],
                ) 
              ),
              topIconButton ?? const SizedBox(width: 0,)
            ],
          ),
          SizedBox(height: height ?? 10,),
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
              bottomButton ?? const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}