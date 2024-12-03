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
  List<Subject> _avaliableSubjects = [];
  List<Subject> _unselectedSubject = [];
  List<Subject> _selectedSubjects = [];
  bool avaliableVisibility = true;
  bool selectedvisibility = true;
  bool loadingAvailable = true;
  bool loadingSelected = true;

  Future<void> fetchAvaliableSubjects() async {
    final data = await AcademicService.fetchAvaliableSubjects();
    if (data != null) {
      _avaliableSubjects = data;
    }
  }

  Future<void> fetchSelectedSubjects() async {
    final data = await AcademicService.fetchSelectedSubjects();
    if (data != null) {
      _selectedSubjects = data;
    }
  }

  Future<void> mergeAvailableAndSelectedSubject() async {
    await fetchAvaliableSubjects();
    await fetchSelectedSubjects();

    List<String> selectedCode = [];
    _unselectedSubject = [];

    for (var subject in _selectedSubjects) {
      selectedCode.add(subject.codigo);
      subject.confirmada = true;
    }

    for (var subject in _avaliableSubjects) {
      if (selectedCode.contains(subject.codigo)) {
        _selectedSubjects[selectedCode.indexOf(subject.codigo)].horario = subject.horario;
      } else {
        subject.confirmada = false;
        _unselectedSubject.add(subject);
      }
    }

    if (mounted) {
      setState(() {
        loadingAvailable = false; // Datos de asignaturas disponibles cargados
        loadingSelected = false; // Datos de asignaturas seleccionadas cargados
      });
    }
  }

  @override
  void initState() {
    super.initState();
    mergeAvailableAndSelectedSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandButton(
            text: "Asignaturas Disponibles",
            icon: Icons.expand_more,
            icon2: Icons.expand_less,
            state: true,
            onPressed: () {
              avaliableVisibility = !avaliableVisibility;
              setState(() {});
            },
          ),
          if (loadingAvailable)
            const CustomCircularProgress(), // Mostrar símbolo de carga para asignaturas disponibles
          if (!loadingAvailable && _unselectedSubject.isEmpty && avaliableVisibility)
            Text('No hay asignaturas disponibles', style: Theme.of(context).textTheme.bodyMedium),
          if (avaliableVisibility) const SizedBox(height: 10),
          if (avaliableVisibility && !loadingAvailable && _unselectedSubject.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _unselectedSubject.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjetsSelectionCard(
                        onPressed: () async {
                          LoadingModal.show(context, "Seleccionando Asignatura"); 
                          bool? result = await AcademicService.selectSubject(_unselectedSubject[index].codigo); 
                          Navigator.pop(context); // Cierra el modal de carga 
                          if (result == true) { 
                            SuccessModal.show(context, "Asignatura seleccionada correctamente");
                          } else { 
                            ErrorModal.show(context,  "Hubo un problema al seleccionar la asignatura"); 
                          } 
                          mergeAvailableAndSelectedSubject(); 
                        },
                        subject: _unselectedSubject[index],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ExpandButton(
            text: "Asignaturas Seleccionadas",
            icon: Icons.expand_more,
            icon2: Icons.expand_less,
            state: true,
            onPressed: () {
              selectedvisibility = !selectedvisibility;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          if (loadingSelected)
            const CustomCircularProgress(),
          if (!loadingSelected && _selectedSubjects.isEmpty && selectedvisibility)
            Text('No hay asignaturas seleccionadas', style: Theme.of(context).textTheme.bodyMedium),
          if (!loadingSelected && _selectedSubjects.isNotEmpty && selectedvisibility )
            Expanded(
              child: ListView.builder(
                itemCount: _selectedSubjects.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjetsSelectionCard(
                        onPressed: () async {
                          LoadingModal.show(context, "Seleccionando Asignatura"); 
                          bool? result = await AcademicService.deselectSubject(_selectedSubjects[index].codigo); 
                          
                          Navigator.pop(context); // Cierra el modal de carga 
                          if (result == true) { 
                            SuccessModal.show(context, "Asignatura deseleccionada correctamente");
                          } else { 
                            ErrorModal.show(context, "Hubo un problema al deseleccionar la asignatura");
                          } 
                          mergeAvailableAndSelectedSubject(); 
                          mergeAvailableAndSelectedSubject();
                        },
                        subject: _selectedSubjects[index],
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

