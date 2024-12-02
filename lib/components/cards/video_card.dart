import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button_small.dart';
import 'package:uasd_app/models/video.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/youtube_player.dart';

class VideoCard extends StatelessWidget {

  final Video video;

  const VideoCard({super.key, required this.video});


  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    String videourl = "https://www.youtube.com/watch?v=${video.url}";

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.titulo, style: textTheme.labelLarge),
                const SizedBox(height: 5),
                Text(video.fechaPublicacion.toString().split(".")[0], style: textTheme.bodySmall),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                YouTubePlayer(videoUrl: videourl),
                CustomIconButtonSmall(url: videourl)
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}