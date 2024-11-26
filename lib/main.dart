import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/icon_button_small.dart';
import 'package:uasd_app/components/buttons/outline_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/cards/subject_selection_info_card.dart';
import 'package:uasd_app/components/cards/text_card.dart';
import 'package:uasd_app/components/others/selection_subjects_card_list.dart';
import 'package:uasd_app/components/others/info_table.dart';
import 'package:uasd_app/components/others/tag.dart';
import 'package:uasd_app/screens/principal_screen.dart';
import 'package:uasd_app/utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      theme: appTheme,
      home: const HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
          SolidButton(
            text: "Pago en Linea", 
            onPressed: () {
              Navigator.push(
                context, // Context está asociado a MaterialApp
                MaterialPageRoute(builder: (context) => const PrincipalScreen()),
              );
            },
          ),
          OutlineButton(
            text: "Agregar Entrega", 
            onPressed: () {
              Navigator.push(
                context, // Context está asociado a MaterialApp
                MaterialPageRoute(builder: (context) => const PrincipalScreen()),
              );
            },
          ),
          TextCard(
            title: "Introduccion al desarrollo de Aplicaciones Moviles",
            subtitle: "10:00 - 12:00",
            topIconButton: IconButtonSmall(
              icon: Icons.map_outlined, 
              onPressed: () {
                Navigator.push(
                  context, // Context está asociado a MaterialApp
                  MaterialPageRoute(builder: (context) => const PrincipalScreen()),
                );
              },
            ),
            tag1: const Tag(text: "Sesion 23"),
            tag2: const Tag(text: "Aula 23-E"),
          ),
          const SizedBox(height: 20,),
          TextCard(
            title: "Evento en estadio de beisbol, entre equipo del ITLA y la UASD ",
            tag1: const Tag(text: "19/05/2024 16:00"),
            bottomButton: CustomTextButton(
              text: "Ver Detalles", 
              onPressed: () {
              Navigator.push(
                context, // Context está asociado a MaterialApp
                MaterialPageRoute(builder: (context) => const PrincipalScreen()),
              );
            },
            ),
          ),
          const SizedBox(height: 20,),
          TextCard(
            title: "Vencimiento de proyecto final de aplicaciones monbiles ",
            subtitle: "Asignatura: Introduccion al desarrollo de aplicaciones moviles",
            topIconButton: IconButtonSmall(
              icon: Icons.check_box_outline_blank, 
              icon2: Icons.check_box_outlined,
              state: false,
              onPressed: ()=>{}),
            tag1: const Tag(text: "10:00"),
            bottomButton: CustomTextButton(
              text: "Agregar Entrega", 
              onPressed: () {
              Navigator.push(
                context, // Context está asociado a MaterialApp
                MaterialPageRoute(builder: (context) => const PrincipalScreen()),
              );
            },),
          ), 
          const SizedBox(height: 20,),
          SubjetsSelectionCardsList(
            title: "Matematica", 
            credits: 3,
            items: [
              SubjectSelectionInfoCard(
                section: "43", 
                  schedule: "Miercoles 22:00 - 24:00", 
                  places: "12/20", 
                  state: false,
                  onPressed: ()=>{},
                )
              ] 
            ),
            const SizedBox(height: 20,),
            SubjetsSelectionCardsList(
            title: "Introduccion al desarrollo de aplicaciones moviles", 
            credits: 3,
            items: [
              SubjectSelectionInfoCard(
                section: "43", 
                  schedule: "Lunes 8:00 - 12:00", 
                  places: "12/20", 
                  state: false,
                  onPressed: ()=>{},
                ),
                SubjectSelectionInfoCard(
                section: "43", 
                  schedule: "Miercoles 8:00 - 12:00 \n Jueves 8:00 - 9:00", 
                  places: "12/20", 
                  state: false,
                  onPressed: ()=>{},
                ),
                SubjectSelectionInfoCard(
                section: "43", 
                  schedule: "Lunes 8:00 - 12:00", 
                  places: "12/20", 
                  state: false,
                  onPressed: ()=>{},
                )
              ] 
            ),
            const SizedBox(height: 20,),
            InfoTable( 
              columns: const ['Columna 1', 'Columna 2', 'Columna 3'], 
              rows: const [ 
                ['Fila 1, Celda 1', 'Fila 1, Celda 2', 'Fila 1, Celda 3'], 
                ['Fila 2, Celda 1', 'Fila 2, Celda 2', 'Fila 2, Celda 3'], 
                ['Fila 3, Celda 1', 'Fila 3, Celda 2', 'Fila 3, Celda 3'], 
                ['Fila 3, Celda 1', 'Fila 3, Celda 2', 'Fila 3, Celda 3'], 
                ['Fila 3, Celda 1', 'Fila 3, Celda 2', 'Fila 3, Celda 3'], 
                ],
            )
          ],
        ),
      ),
    );
  }
}