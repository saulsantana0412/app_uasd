import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/inputs/drop_down_input.dart';
import 'package:uasd_app/components/inputs/text_input.dart';
import 'package:uasd_app/components/modals/error_modal.dart';
import 'package:uasd_app/models/request_type.dart';
import 'package:uasd_app/services/request_service.dart';

class NewRequestScreen extends StatefulWidget {
  final List<RequestType> requestTypes;

  const NewRequestScreen({super.key, required this.requestTypes});

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  final _descriptionController = TextEditingController();
  String? _requestTypeCode;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Título de la pantalla
            Text("Nueva Solicitud", style: textTheme.titleMedium),
            const SizedBox(height: 20),

            // Dropdown para seleccionar el tipo de solicitud
            DropdownInput(
              label: 'Tipo de Solicitud',
              items: widget.requestTypes,
              value: _requestTypeCode,
              onChanged: (value) {
                setState(() {
                  _requestTypeCode = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Campo de texto para la descripción
            TextInput(
              label: 'Descripcion',
              controller: _descriptionController,
              minLines: 1,
              maxLines: 4,
            ),
            const SizedBox(height: 20),

            // Botón para enviar la solicitud
            SolidButton(
              text: "Enviar Solicitud",
              onPressed: () async {
                if (_formKey.currentState!.validate() && _requestTypeCode != null && _descriptionController.text.isNotEmpty) {
                  // Llamar al servicio para crear la solicitud
                  bool? result = await RequestService.createRequest(_requestTypeCode!, _descriptionController.text.trim());

                  // Comprobar el resultado de la creación de la solicitud
                  if(result == true){
                    Navigator.pop(context, true); // Cerrar la pantalla si es exitosa
                  } else {
                    ErrorModal.show(context, "Ya tienes una solicitud pendiente de este tipo.");
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}