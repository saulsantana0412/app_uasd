import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/expand_button.dart';
import 'package:uasd_app/components/cards/selection_subjects_card.dart';
import 'package:uasd_app/components/modals/error_modal.dart';
import 'package:uasd_app/components/modals/loading_modal.dart';
import 'package:uasd_app/components/modals/success_modal.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/services/academic_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjectPreselectionScreen extends StatefulWidget {
  const SubjectPreselectionScreen({super.key});

  @override
  State<SubjectPreselectionScreen> createState() => _SubjectPreselectionScreenState();
}

class _SubjectPreselectionScreenState extends State<SubjectPreselectionScreen> {
  // Listas para almacenar las asignaturas disponibles, no seleccionadas y seleccionadas
  List<Subject> _avaliableSubjects = [];
  List<Subject> _unselectedSubject = [];
  List<Subject> _selectedSubjects = [];
  
  // Controladores de visibilidad de las secciones
  bool avaliableVisibility = true;
  bool selectedvisibility = true;
  
  // Indicadores de carga
  bool loadingAvailable = true;
  bool loadingSelected = true;

  // Función para obtener las asignaturas disponibles
  Future<void> fetchAvaliableSubjects() async {
    final data = await AcademicService.fetchAvaliableSubjects();
    if (data != null) {
      _avaliableSubjects = data; // Asigna las asignaturas disponibles
    }
  }

  // Función para obtener las asignaturas seleccionadas
  Future<void> fetchSelectedSubjects() async {
    final data = await AcademicService.fetchSelectedSubjects();
    if (data != null) {
      _selectedSubjects = data; // Asigna las asignaturas seleccionadas
    }
  }

  // Función para combinar asignaturas disponibles y seleccionadas
  Future<void> mergeAvailableAndSelectedSubject() async {
    await fetchAvaliableSubjects();
    await fetchSelectedSubjects();

    List<String> selectedCode = [];
    _unselectedSubject = [];

    // Marcar las asignaturas seleccionadas como confirmadas
    for (var subject in _selectedSubjects) {
      selectedCode.add(subject.codigo);
      subject.confirmada = true;
    }

    // Asignar horarios y marcar las asignaturas no seleccionadas
    for (var subject in _avaliableSubjects) {
      if (selectedCode.contains(subject.codigo)) {
        _selectedSubjects[selectedCode.indexOf(subject.codigo)].horario = subject.horario;
      } else {
        subject.confirmada = false;
        _unselectedSubject.add(subject); // Añadir asignaturas no seleccionadas
      }
    }

    if (mounted) {
      setState(() {
        loadingAvailable = false; // Detener carga de asignaturas disponibles
        loadingSelected = false; // Detener carga de asignaturas seleccionadas
      });
    }
  }

  @override
  void initState() {
    super.initState();
    mergeAvailableAndSelectedSubject(); // Inicia la carga y fusión de asignaturas
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor, // Fondo de la pantalla
      ),
      padding: const EdgeInsets.all(20), // Padding alrededor del contenido
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botón expandible para las asignaturas disponibles
          ExpandButton(
            text: "Asignaturas Disponibles",
            icon: Icons.expand_more,
            icon2: Icons.expand_less,
            state: true,
            onPressed: () {
              avaliableVisibility = !avaliableVisibility; // Cambia la visibilidad
              setState(() {});
            },
          ),
          
          if (loadingAvailable)
            const CustomCircularProgress(), // Mostrar indicador de carga mientras se cargan las asignaturas disponibles
          if (!loadingAvailable && _unselectedSubject.isEmpty && avaliableVisibility)
            Text('No hay asignaturas disponibles', style: Theme.of(context).textTheme.bodyMedium),
          
          if (avaliableVisibility) const SizedBox(height: 10),
          
          // Lista de asignaturas disponibles
          if (avaliableVisibility && !loadingAvailable && _unselectedSubject.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _unselectedSubject.length, // Número de asignaturas disponibles
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tarjeta para seleccionar asignatura
                      SubjetsSelectionCard(
                        onPressed: () async {
                          LoadingModal.show(context, "Seleccionando Asignatura"); // Mostrar modal de carga
                          bool? result = await AcademicService.selectSubject(_unselectedSubject[index].codigo); 
                          Navigator.pop(context); // Cerrar modal de carga
                          if (result == true) {
                            SuccessModal.show(context, "Asignatura seleccionada correctamente"); // Mostrar éxito
                          } else {
                            ErrorModal.show(context,  "Hubo un problema al seleccionar la asignatura"); // Mostrar error
                          }
                          mergeAvailableAndSelectedSubject(); // Recargar asignaturas
                        },
                        subject: _unselectedSubject[index], // Asignatura a mostrar
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          
          // Botón expandible para las asignaturas seleccionadas
          ExpandButton(
            text: "Asignaturas Seleccionadas",
            icon: Icons.expand_more,
            icon2: Icons.expand_less,
            state: true,
            onPressed: () {
              selectedvisibility = !selectedvisibility; // Cambia la visibilidad
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          
          if (loadingSelected)
            const CustomCircularProgress(), // Mostrar indicador de carga mientras se cargan las asignaturas seleccionadas
          
          if (!loadingSelected && _selectedSubjects.isEmpty && selectedvisibility)
            Text('No hay asignaturas seleccionadas', style: Theme.of(context).textTheme.bodyMedium),
          
          // Lista de asignaturas seleccionadas
          if (!loadingSelected && _selectedSubjects.isNotEmpty && selectedvisibility)
            Expanded(
              child: ListView.builder(
                itemCount: _selectedSubjects.length, // Número de asignaturas seleccionadas
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tarjeta para deseleccionar asignatura
                      SubjetsSelectionCard(
                        onPressed: () async {
                          LoadingModal.show(context, "Deseleccionando Asignatura"); // Mostrar modal de carga
                          bool? result = await AcademicService.deselectSubject(_selectedSubjects[index].codigo);
                          Navigator.pop(context); // Cerrar modal de carga
                          if (result == true) {
                            SuccessModal.show(context, "Asignatura deseleccionada correctamente"); // Mostrar éxito
                          } else {
                            ErrorModal.show(context, "Hubo un problema al deseleccionar la asignatura"); // Mostrar error
                          }
                          mergeAvailableAndSelectedSubject(); // Recargar asignaturas
                        },
                        subject: _selectedSubjects[index], // Asignatura a mostrar
                      ),
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
