import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
import 'package:uasd_app/components/tables/debts_table.dart';
import 'package:uasd_app/models/debt.dart';
import 'package:uasd_app/services/debt_service.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key});

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {

  List<Debt> _debts = [];

  Future <void> fetchDebts() async{
    final data = await DebtService.fetchDebts();
    if(data != null){
      _debts = data;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDebts();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagos"),
      ),
      drawer: const StudentPortalMenu(currentScreen: "DebtsScreen",),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Mis Pagos", style: textTheme.titleMedium,),
            const SizedBox(height: 20,),
            DebtsTable(
              debts: _debts
            ),
            const SizedBox(width: double.infinity,)
          ],
        ),
      ),
      floatingActionButton: 
      SolidButton(
        text: "Pago en Linea", 
        onPressed: (){
            Launch.url("https://soft.uasd.edu.do/pagoenlinea/");
          }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}