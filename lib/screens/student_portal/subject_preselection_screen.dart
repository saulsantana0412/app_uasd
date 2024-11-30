import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
import 'package:uasd_app/components/others/selection_subjects_card_list.dart';
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

    setState((){});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mergeAvaliableAndSelectedSubject();
    
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Preseleccion"),
      ),
      drawer: const StudentPortalMenu(currentScreen: 'SubjectPreselectionScreen',),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Disponibles", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: _unselectedSubjet.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjetsSelectionCardsList(
                        onPressed: () async {
                          print(await AcademicService.selectSubject(_unselectedSubjet[index].codigo));
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
            Text("Seleccionadas", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedSubjects.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjetsSelectionCardsList(
                        onPressed: () async {
                          print(await AcademicService.deselectSubject(_selectedSubjects[index].codigo));
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
      ),
    );
  }
}