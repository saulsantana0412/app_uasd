import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/event_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/event.dart';
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  List<Event> _events = [];
  bool _loading = true;

  Future <void> fetchEvents() async{
    final data = await ContentService.fetchEvents();
    if(data != null && mounted){
      _events = data;
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents();
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
            Text("Eventos", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            if(_loading) const CustomCircularProgress(),
            if (!_loading && _events.isEmpty)
            Text("No hay eventos en calendario.", style: Theme.of(context).textTheme.bodyMedium),
            if (!_loading && _events.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventCard(event: _events[index]),
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