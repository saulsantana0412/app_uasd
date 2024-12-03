import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button_small.dart';
import 'package:uasd_app/models/new.dart';
import 'package:uasd_app/utils/app_colors.dart';


class NewsCard extends StatelessWidget {

  final New newArticle;

  const NewsCard({super.key, required this.newArticle});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05),
            blurRadius: 10
        )]
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                Image.network(newArticle.img, fit: BoxFit.cover),
                CustomIconButtonSmall(
                  url: newArticle.url
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newArticle.date, style: textTheme.bodySmall),
                const SizedBox(height: 5),
                Text(newArticle.title, style: textTheme.labelLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}