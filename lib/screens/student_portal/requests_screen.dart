import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/tables/request_table.dart';
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/models/request_type.dart';
import 'package:uasd_app/components/others/new_request_modal.dart';
import 'package:uasd_app/services/request_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {

  List<Request> _requests = [];
  List<RequestType> _requestsTypes = [];

  Future <void> fetchRequest() async{
    final data = await RequestService.fetchRequests();
    if(data != null && mounted){
      setState(() {
      _requests = data;
      });
    }else{
      _requests = [];
    }
  }

  Future<void> updateView() async {
    await fetchRequest();
  }

  Future <void> fetchRequestTypes() async{
    final data = await RequestService.fetchRequestTypes();
    if(data != null && mounted){
      _requestsTypes = data;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRequest();
    fetchRequestTypes();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mis solicitudes", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            Expanded(
              child: RequestTable(
                requests: _requests,
                update: updateView,
              )
            ),
            const SizedBox(height: 60,)
          ],
        ),
      ),
      floatingActionButton: 
        SolidButton(text: "Nueva Solicitud", 
        onPressed: () async {
          final bool? result = await showModalBottomSheet(
            context: context, 
            builder: (context) {
              return NewRequestScreen(requestTypes: _requestsTypes);
            },
            isScrollControlled: true
          );
        if(result == true){
          updateView();
        }
        }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}