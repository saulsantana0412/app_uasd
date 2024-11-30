import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca De"),
      ),
      drawer: const StudentPortalMenu(currentScreen: "AboutUsScreen",),
    );
  }
}