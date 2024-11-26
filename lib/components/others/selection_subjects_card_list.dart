import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

class SubjetsSelectionCardsList extends StatefulWidget {

  final String title;
  final int credits;
  final List<Widget> items;

  const SubjetsSelectionCardsList({super.key, required this.title, required this.credits, required this.items});

  @override
  State<SubjetsSelectionCardsList> createState() => _SubjetsSelectionCardsListState();
}

class _SubjetsSelectionCardsListState extends State<SubjetsSelectionCardsList> {

  bool _isVisible = false;
  String _textbutton = "Ver horarios";
  IconData _icon = Icons.keyboard_arrow_down;


  void _toggleVisibility(){
    _isVisible = !_isVisible;

    setState(() {
      if(_isVisible){
        _textbutton = "Ocultar horarios";
        _icon = Icons.keyboard_arrow_up;
      }else{
        _textbutton = "Ver horarios";
        _icon = Icons.keyboard_arrow_down;
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.gray
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: textTheme.titleMedium,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${widget.credits.toString()} creditos", style: textTheme.bodyMedium,),
                      CustomTextButton(
                        text: _textbutton, 
                        icon: _icon,
                        onPressed: _toggleVisibility)
                    ],
                  )
                ],
              ),
            ),
        _isVisible ? 
        Column(children: widget.items)
        : const SizedBox()
      ]
     ), 
    );
  }
}