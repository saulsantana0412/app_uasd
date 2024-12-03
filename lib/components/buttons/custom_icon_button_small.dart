import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class CustomIconButtonSmall extends StatelessWidget {
  final String url;
  const CustomIconButtonSmall({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 35,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(5),
        ),
        child: CustomIconButton(
          icon: Icons.link,
          onPressed: () {
            ConfirmModal.show(
              context, 
              message: "Se te redigirá a una pagina externa.", 
              question: "¿Quieres continuar?", 
              cancelButtonText: "No", 
              continueButtonText: "Si", 
              onPressed: (){
                Navigator.pop(context);
                Launch.url(url);
              }
            );
          },
        ),
      ),
    );
  }
}