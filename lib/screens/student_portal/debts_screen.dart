import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart'; 
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/components/tables/debts_table.dart'; 
import 'package:uasd_app/models/debt.dart';
import 'package:uasd_app/services/debt_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key});

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  List<Debt> _debts = []; // Lista para almacenar las deudas obtenidas.
  bool _loading = true; // Indicador de carga.

  // Método para obtener las deudas desde el servicio.
  Future<void> fetchDebts() async {
    final data = await DebtService.fetchDebts(); // Llamada al servicio para obtener datos.
    if (data != null && mounted) { // Verifica si los datos no son nulos y si el widget está montado.
      _debts = data; // Asigna los datos obtenidos a la lista de deudas.
      setState(() {
        if (mounted) { // Asegura que el widget siga montado antes de actualizar el estado.
          _loading = false; // Indica que la carga ha finalizado.
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDebts(); // Llama al método para cargar las deudas al inicializar el widget.
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual.

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Establece el color de fondo.
        ),
        padding: const EdgeInsets.all(20), // Aplica un padding uniforme.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los hijos al inicio en el eje horizontal.
          children: [
            Text(
              "Mis Pagos", 
              style: textTheme.titleMedium, // Muestra el título "Mis Pagos".
            ),
            const SizedBox(height: 10), // Espaciado debajo del título.
            
            // Muestra el indicador de progreso si aún se están cargando los datos.
            if (_loading) 
              const CustomCircularProgress(),

            // Si no hay deudas pendientes, muestra un mensaje.
            if (!_loading && _debts.isEmpty)
              Text(
                "No tienes pagos pendientes.", 
                style: textTheme.bodyMedium,
              ),

            // Si hay deudas disponibles, muestra la tabla de deudas.
            if (!_loading)
              DebtsTable(debts: _debts), // Componente que recibe la lista de deudas.

            const SizedBox(width: double.infinity), // Espaciado para ajustar el diseño.
          ],
        ),
      ),
      
      // Botón flotante para realizar el pago en línea.
      floatingActionButton: SolidButton(
        text: "Pago en Linea", // Texto del botón.
        onPressed: () {
          // Muestra un modal de confirmación al presionar el botón.
          ConfirmModal.show(
            context,
            message: "Se te redigirá a la página de pago.", // Mensaje del modal.
            question: "¿Quieres continuar?", // Pregunta de confirmación.
            cancelButtonText: "No", // Texto del botón de cancelar.
            continueButtonText: "Si", // Texto del botón de continuar.
            onPressed: () {
              // Si el usuario confirma, cierra el modal y abre la URL.
              Navigator.pop(context); 
              Launch.url("https://soft.uasd.edu.do/pagoenlinea/"); // Redirige al enlace de pagos.
            },
          );
        },
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Ubicación del botón flotante.
    );
  }
}
