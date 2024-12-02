import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/cards/text_card.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/components/others/tag.dart';
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

  Future <void> fetchEvents() async{
    final data = await ContentService.fetchEvents();
    if(data != null && mounted){
      _events = data;
      setState(() {
        
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
            Text("Eventos", style: textTheme.headlineMedium,),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCard(
                        title: _events[index].titulo,
                        subtitle: _events[index].descripcion,
                        tag1: Tag(text: _events[index].fechaEvento.toString().split(".")[0]),
                        tag2: Tag(text: _events[index].lugar),
                        topIconButton: CustomIconButton(
                          icon: Icons.map_outlined, 
                          onPressed: (){ 
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                             return MapScreen(
                                  coordenates: _events[index].coordenadas,); 
                              }
                            ));
                          }
                        ),
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