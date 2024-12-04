import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/task_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/services/academic_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class TasksScreen extends StatefulWidget {

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  // Lista para almacenar las tareas obtenidas desde el servicio
  List<Task> _tasks = [];
  
  // Indicador de carga
  bool loading = true;

  // Método para obtener las tareas desde el servicio AcademicService
  Future <void> fetchTasks() async {
    final data = await AcademicService.fetchTasks();
    if (data != null && mounted) {
      _tasks = data; // Asigna las tareas obtenidas a la lista _tasks
      setState(() {
        loading = false; // Detiene el indicador de carga
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTasks(); // Llama al método para obtener las tareas cuando la pantalla se inicializa
  }

  @override
  Widget build(BuildContext context) {

    // Obtener el tema de texto de la aplicación
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Fondo de la pantalla
        ),
        padding: const EdgeInsets.all(20), // Padding alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mis Tareas", style: textTheme.titleMedium), // Título de la pantalla
            const SizedBox(height: 10),
            if (loading) const CustomCircularProgress(), // Mostrar indicador de carga si se está cargando
            if (!loading && _tasks.isEmpty) // Si no hay tareas y la carga ha terminado
              Text("Aún no hay tareas que mostrar.", style: Theme.of(context).textTheme.bodyMedium),
            if (!loading && _tasks.isNotEmpty) // Si ya se cargaron las tareas y hay tareas disponibles
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length, // Número de tareas
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskCard(task: _tasks[index]), // Mostrar cada tarea en una tarjeta
                        const SizedBox(height: 20),
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
