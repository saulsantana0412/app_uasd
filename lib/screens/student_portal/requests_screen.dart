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

  List<Request> _requests = []; // Lista para almacenar las solicitudes obtenidas.
  List<RequestType> _requestsTypes = []; // Lista para almacenar los tipos de solicitud.
  bool loading = true; // Estado de carga de las solicitudes.

  // Función para obtener las solicitudes desde el servicio.
  Future <void> fetchRequest() async{
    final data = await RequestService.fetchRequests(); // Llama al servicio para obtener las solicitudes.
    if(data != null && mounted){
      _requests = data; // Si la respuesta es válida, se almacenan las solicitudes.
      setState(() {
        loading = false; // Se cambia el estado de carga a falso.
      });
    }else{
      _requests = []; // Si no hay solicitudes, se limpia la lista.
    }
  }

  // Función para actualizar la vista llamando a fetchRequest().
  Future<void> updateView() async {
    await fetchRequest(); // Vuelve a cargar las solicitudes.
  }

  // Función para obtener los tipos de solicitudes desde el servicio.
  Future <void> fetchRequestTypes() async{
    final data = await RequestService.fetchRequestTypes(); // Llama al servicio para obtener los tipos de solicitud.
    if(data != null && mounted){
      _requestsTypes = data; // Si la respuesta es válida, se almacenan los tipos de solicitud.
      setState(() {});
    }
  }

  // Inicializa la pantalla y obtiene los datos necesarios.
  @override
  void initState() {
    super.initState();
    fetchRequest(); // Llama para obtener las solicitudes.
    fetchRequestTypes(); // Llama para obtener los tipos de solicitudes.
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual.

    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Establece el color de fondo de la pantalla.
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Establece el color de fondo del contenedor.
        ),
        padding: const EdgeInsets.all(20), // Establece el padding del contenedor.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda.
          children: [
            Text("Mis solicitudes", style: textTheme.titleMedium,), // Título de la pantalla.
            const SizedBox(height: 10,), // Espaciado entre los elementos.
            if (loading) const CustomCircularProgress(), // Muestra el círculo de carga si está cargando los datos.
            if (!loading && _requests.isEmpty)
              Text("Aun no tienes ninguna solicitud.", style: Theme.of(context).textTheme.bodyMedium), // Mensaje cuando no hay solicitudes.
            if(!loading && _requests.isNotEmpty)
              RequestsTable( // Muestra la tabla de solicitudes si ya están cargadas.
                requests: _requests,
                onPressed: (Request request) async {
                  // Al presionar una solicitud, muestra el modal de detalles.
                  final bool? result = await showModalBottomSheet(
                    context: context, 
                    builder: (context) {
                      return RequestDetailModal(request: request); // Muestra los detalles de la solicitud.
                    },
                    isScrollControlled: true, // Permite scroll controlado en el modal.
                    showDragHandle: true, // Muestra el drag handle para el modal.
                    backgroundColor: AppColors.white // Color de fondo del modal.
                  );
                  // Si el resultado es verdadero, muestra un modal de éxito y actualiza la vista.
                  if(result == true){
                    SuccessModal.show(context, "Solicitud eliminada correctamente.");
                    updateView();
                  }else if(result == false){
                    ErrorModal.show(context, "Hubo un problema al eliminar la solicitud.");
                  }
              }),
            const SizedBox(height: 60,) // Espaciado al final de la columna.
          ],
        ),
      ),
      // Botón flotante para crear una nueva solicitud.
      floatingActionButton: 
        SolidButton(
          text: "Nueva Solicitud", 
          onPressed: () async {
            // Muestra el modal para crear una nueva solicitud.
            final bool? result = await showModalBottomSheet(
              context: context, 
              builder: (context) {
                return NewRequestScreen(requestTypes: _requestsTypes); // Modal para crear una nueva solicitud.
              },
              isScrollControlled: true, 
              showDragHandle: true, 
              backgroundColor: AppColors.white
            );
            // Si la solicitud fue creada exitosamente, muestra el modal de éxito y actualiza la vista.
            if(result == true){
              SuccessModal.show(context, "Solicitud creada correctamente.");
              updateView();
            }
          }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Ubicación del botón flotante.
    );
  }
}
