import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget que muestra una tarjeta con la información de una asignatura.
class SubjetsSelectionCard extends StatelessWidget {

  final Subject subject; // La asignatura a mostrar.
  final VoidCallback onPressed; // Acción que se ejecuta al presionar el botón de confirmación.

  const SubjetsSelectionCard({super.key, required this.subject, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme; 
    
    return Column(
      children: [
        // Contenedor para la cabecera de la tarjeta con el nombre de la asignatura y el botón de confirmación.
        Container(
          width: double.infinity, // Ocupa todo el ancho disponible.
          padding: const EdgeInsets.all(10), // Espaciado interno.
          decoration: BoxDecoration(
            color: AppColors.ligthBlue, 
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), // Redondeo superior izquierdo.
              topRight: Radius.circular(10), // Redondeo superior derecho.
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGray.withOpacity(.05), // Sombra sutil.
                blurRadius: 10, 
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los elementos.
            children: [
              Text(
                subject.nombre, // Muestra el nombre de la asignatura.
                style: textTheme.titleSmall,
              ),
              CustomIconButton(
                icon: Icons.check_box_outline_blank, // Icono para indicar que no está confirmada.
                icon2: Icons.check_box_outlined, // Icono para indicar que está confirmada.
                state: subject.confirmada, // Estado de la asignatura (confirmada o no).
                onPressed: onPressed, // Acción al presionar el botón.
              ),
            ],
          ),
        ),
        // Contenedor para la información adicional de la asignatura.
        Container(
          padding: const EdgeInsets.all(10), // Espaciado interno.
          decoration: const BoxDecoration(
            color: AppColors.white, // Fondo blanco.
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), // Redondeo inferior izquierdo.
              bottomRight: Radius.circular(10), // Redondeo inferior derecho.
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los elementos.
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Column(
                children: [
                  Text("Codigo", style: textTheme.labelMedium), // Muestra el título "Codigo".
                  Text(subject.codigo, style: textTheme.bodyMedium), // Muestra el código de la asignatura.
                ],
              ),
              Column(
                children: [
                  Text("Horario", style: textTheme.labelMedium), // Muestra el título "Horario".
                  Text(subject.horario ?? "", style: textTheme.bodyMedium, softWrap: true), // Muestra el horario de la asignatura.
                ],
              ),
              Column(
                children: [
                  Text("Aula", style: textTheme.labelMedium), // Muestra el título "Aula".
                  Text(subject.aula, style: textTheme.bodyMedium), // Muestra el aula de la asignatura.
                ],
              ),
              CustomIconButton(
                icon: Icons.map_outlined, 
                onPressed: () {
                  // Navega a la pantalla de mapa con las coordenadas de la asignatura.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MapScreen(
                      coordenates: subject.ubicacion,
                    );
                  }));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}