import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/news_card.dart';
import 'package:uasd_app/models/new.dart';
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  List<New> _news = [];

  Future <void> fetchNews() async{
    final data = await ContentService.fetchNews();
    if(data != null && mounted){
      _news = data;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }


  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Noticias de la UASD", style: textTheme.titleMedium,),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsCard(
                        title: _news[index].title, 
                        url: _news[index].url, 
                        imageUrl: _news[index].img, 
                        date: _news[index].date
                      ),
                      const SizedBox(height: 20,)
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