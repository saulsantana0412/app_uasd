import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/news_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
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
  bool _loading = true;

  Future <void> fetchNews() async{
    final data = await ContentService.fetchNews();
    if(data != null && mounted){
      _news = data;
      setState(() {
        if(mounted){
          _loading = false;
        }
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

    return RefreshIndicator(
      onRefresh: ()=>fetchNews(),
      color: AppColors.darkblue,
      backgroundColor: AppColors.white,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Noticias de la UASD", style: textTheme.titleMedium,),
              const SizedBox(height: 20,),
              if(_loading) const CustomCircularProgress(),
              if (!_loading && _news.isEmpty)
              Text("Aun no hay noticias publicados", style: Theme.of(context).textTheme.bodyMedium),
              if(!_loading && _news.isNotEmpty) 
              Expanded(
                child: ListView.builder(
                  itemCount: _news.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsCard(newArticle: _news[index]),
                        const SizedBox(height: 20,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}