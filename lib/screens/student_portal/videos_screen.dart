import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/video_card.dart';
import 'package:uasd_app/models/video.dart';
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
// import 'package:uasd_app/utils/methods/youtube_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {

  List<Video> _videos = [];

  Future <void> fetchVideos() async{
    final data = await ContentService.fetchVideos();
    if(data != null && mounted){
      _videos = data;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchVideos();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Videos publicados", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: _videos.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoCard(video: _videos[index]),
                      const SizedBox(height: 20,),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}