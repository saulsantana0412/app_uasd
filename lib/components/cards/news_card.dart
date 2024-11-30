import 'package:flutter/material.dart';
// import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/buttons/custom_icon_button_small.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {

  final String title;
  final String url;
  final String imageUrl;
  final String date;

  const NewsCard({super.key, required this.title, required this.url, required this.imageUrl, required this.date});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Container(
  width: double.infinity,
  decoration: const BoxDecoration(
    color: AppColors.ligthBlue,
    borderRadius: BorderRadius.all(Radius.circular(10)),
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
            Image.network(imageUrl, fit: BoxFit.cover),
            CustomIconButtonSmall(url: url)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: textTheme.bodySmall),
            const SizedBox(height: 5),
            Text(title, style: textTheme.labelLarge),
          ],
        ),
      ),
    ],
  ),
);

  }
}