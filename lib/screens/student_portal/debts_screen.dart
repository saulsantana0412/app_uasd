import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/components/tables/debts_table.dart';
import 'package:uasd_app/models/debt.dart';
import 'package:uasd_app/services/debt_service.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key});

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {

  List<Debt> _debts = [];
  bool _loading = true;

  Future <void> fetchDebts() async{
    final data = await DebtService.fetchDebts();
    if(data != null && mounted){
      _debts = data;
      setState(() {
        if(mounted){
          _loading = false;
        }
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
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mis Pagos", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            if(_loading) 
            const CustomCircularProgress(),
            if (!_loading && _debts.isEmpty)
            Text("No tienes pagos pendientes.", style: Theme.of(context).textTheme.bodyMedium),
            if(!_loading)
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
          ConfirmModal.show(
              context, 
              message: "Se te redigirá a la página de pago.", 
              question: "¿Quieres continuar?", 
              cancelButtonText: "No", 
              continueButtonText: "Si", 
              onPressed: (){
                Navigator.pop(context);
                Launch.url("https://soft.uasd.edu.do/pagoenlinea/");
              }
            );
          }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}