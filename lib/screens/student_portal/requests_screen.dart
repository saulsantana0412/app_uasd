import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/error_modal.dart';
import 'package:uasd_app/components/modals/success_modal.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/components/others/request_detail_modal.dart';
import 'package:uasd_app/components/tables/requests_table.dart';
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
  bool loading = true;

  Future <void> fetchRequest() async{
    final data = await RequestService.fetchRequests();
    if(data != null && mounted){
      _requests = data;
      setState(() {
        loading = false;
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
            if (loading) const CustomCircularProgress(),
            if (!loading && _requests.isEmpty)
            Text("Aun no tienes ninguna solicitud.", style: Theme.of(context).textTheme.bodyMedium),
            if(!loading && _requests.isNotEmpty)
            RequestsTable(
              requests: _requests,
              onPressed: (Request request) async {
                final bool? result = await showModalBottomSheet(
                  context: context, 
                  builder: (context) {
                    return RequestDetailModal(request: request);
                  },
                  isScrollControlled: true,
                  showDragHandle: true,
                  backgroundColor: AppColors.white
                );
                if(result == true){
                  SuccessModal.show(context, "Solicitud eliminada correctamente.");
                  updateView();
                }else if(result == false){
                  ErrorModal.show(context, "Hubo un problema al eliminar la solicitud.");
                }
            }),
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
              isScrollControlled: true,
              showDragHandle: true,
              backgroundColor: AppColors.white
            );
            if(result == true){
              SuccessModal.show(context, "Solicitud creada correctamente.");
              updateView();
            }
          }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}