import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/expand_button.dart';
import 'package:uasd_app/components/cards/selection_subjects_card.dart';
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
  List<Subject> _unselectedSubjet = [];
  List<Subject> _selectedSubjects = [];
  bool avaliableVisibility = true;
  bool selectedvisibility = true;

  Future <void> fetchAvaliableSubjects() async{
    final data = await AcademicService.fetchAvaliableSubjects();
    if(data != null){
      _avaliableSubjects = data;
    }
  }

  Future <void> fetchSelectedSubjects() async{
    final data = await AcademicService.fetchSelectedSubjects();
    if(data != null){
      _selectedSubjects = data;
    }
  }

  Future<void> mergeAvaliableAndSelectedSubject() async {

    await fetchAvaliableSubjects();
    await fetchSelectedSubjects();

    List<String> selectedCode = [];
    _unselectedSubjet = [];

    for (var subject in _selectedSubjects) {
      selectedCode.add(subject.codigo);
      subject.confirmada = true;
    }

    for (var subject in _avaliableSubjects) {
      if(!selectedCode.contains(subject.codigo)){
        subject.confirmada = false;
        _unselectedSubjet.add(subject);
      }
    }
    if(mounted){
      setState((){});
    }
  }

  @override
  void initState() {
    super.initState();
    mergeAvaliableAndSelectedSubject();
  }

  @override
  Widget build(BuildContext context) {

    // TextTheme textTheme = Theme.of(context).textTheme;

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
            state: false,
            onPressed: () {
              avaliableVisibility = !avaliableVisibility;
              setState(() {
                
              });
            },
          ),
          if(avaliableVisibility)const SizedBox(height: 10,),
          if(avaliableVisibility) Expanded(
            child: ListView.builder(
              itemCount: _unselectedSubjet.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubjetsSelectionCard(
                      onPressed: () async {
                        await AcademicService.selectSubject(_unselectedSubjet[index].codigo);
                        mergeAvaliableAndSelectedSubject();
                      }, 
                      subject: _unselectedSubjet[index],
                    ),
                    const SizedBox(height: 20,)
                  ],
                );
              },
            ),
          ),
          ExpandButton(
            text: "Asignaturas Seleccionadas",
            icon: Icons.expand_more, 
            icon2: Icons.expand_less,
            state: false,
            onPressed: () {
              selectedvisibility = !selectedvisibility;
              setState(() {
                
              });
            },
          ),
          if(selectedvisibility) const SizedBox(height: 10,),
          if(selectedvisibility) Expanded(
            child: ListView.builder(
              itemCount: _selectedSubjects.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubjetsSelectionCard(
                      onPressed: () async {
                        await AcademicService.deselectSubject(_selectedSubjects[index].codigo);
                        mergeAvaliableAndSelectedSubject();
                      }, 
                      subject: _selectedSubjects[index],
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