import 'package:flutter/material.dart';

class ExpandButton extends StatefulWidget {

  final String text;
  final IconData icon;
  final IconData icon2;
  final VoidCallback onPressed;
  final bool state;

  const ExpandButton({super.key, required this.icon, required this.onPressed, required this.icon2, required this.state, required this.text});

  @override
  State<ExpandButton> createState() => _ExpandButtonState();
}

class _ExpandButtonState extends State<ExpandButton> {

  late IconData _icon;
  bool _state = false;

  void _onPressed(){
    setState(() {
      _state = !_state;
      _changeIcon();
    });
    widget.onPressed();  
  }

  void _changeIcon(){
    _icon = (_state == false ? widget.icon : widget.icon2);   
  }

  @override
  void initState() {
    super.initState();
    _state = widget.state;
    _changeIcon();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: _onPressed,
      child: Row(
        children: [
          Text(widget.text, style: textTheme.titleMedium,),
          Icon(_icon, size: 28,),
        ],
      ),
    );
  }
}