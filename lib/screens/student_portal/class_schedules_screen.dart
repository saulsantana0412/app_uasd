import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/services/schedule_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ClassSchedulesScreen extends StatefulWidget {
  const ClassSchedulesScreen({super.key});

  @override
  State<ClassSchedulesScreen> createState() => _ClassSchedulesScreenState();
}

class _ClassSchedulesScreenState extends State<ClassSchedulesScreen> {
  List<dynamic> _schedule = []; // Lista para almacenar los horarios obtenidos.
  bool _loading = true; // Indicador de carga para la pantalla.

  // Método para obtener los horarios desde el servicio.
  Future<void> fetchNews() async {
    final data = await ScheduleService.fetchSchedules(); // Llama al servicio para obtener los horarios.
    
    if (data != null) { 
      _schedule = data; // Si los datos no son nulos, se asignan a la lista `_schedule`.
      setState(() {
        if (mounted) { // Verifica que el widget esté montado antes de actualizar el estado.
          _loading = false; // Finaliza la carga.
        }
      });
    } else {
      // Si no se obtienen datos, utiliza un temporizador para simular un pequeño retraso antes de finalizar la carga.
      Timer(const Duration(seconds: 2), () {
        setState(() {
          if (mounted) { // Verifica que el widget esté montado antes de actualizar el estado.
            _loading = false; // Finaliza la carga.
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews(); // Llama al método para obtener los horarios al inicializar el widget.
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual.

    return Container(
      padding: const EdgeInsets.all(20), // Aplica padding uniforme.
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor, // Establece el color de fondo.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos al inicio en el eje horizontal.
        children: [
          // Título de la pantalla.
          Text(
            "Horarios", 
            style: textTheme.titleMedium,
          ),
          
          // Muestra el indicador de progreso mientras se cargan los datos.
          if (_loading) 
            const CustomCircularProgress(),

          // Mensaje predeterminado si no hay horarios disponibles.
          if (!_loading) 
            Text(
              "Aún no tienes horarios confirmados.", 
              style: textTheme.bodyMedium,
            ),

          // Si hay horarios disponibles, muestra una lista.
          if (!_loading && _schedule.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _schedule.length, // Número de elementos en la lista.
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido al inicio.
                    children: [
                      // Aquí se pueden mostrar los datos del horario (por ejemplo, `_schedule[index]`).
                      SizedBox(height: 20), // Espaciado entre los elementos.
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
