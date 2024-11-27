import 'package:flutter/material.dart';
import 'package:uasd_app/main.dart';
import 'package:uasd_app/screens/landing/main_screen.dart';

class LandingMenu extends StatelessWidget {
  const LandingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ));
  }

  Widget buildMenuItems(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: ()=>Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen(),)
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainScreen(),)),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: (){},
          )
        ],
      ),
    );
  }
}