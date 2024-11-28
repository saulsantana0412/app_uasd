import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class TextInput extends StatefulWidget {

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final int minLines;
  final int maxLines;
  final bool required;
  final bool? obscureText;
  final bool enable;


  const TextInput({
    required this.label,
    required this.controller,
    this.validator,
    this.icon,
    this.minLines = 1,
    this.maxLines = 1,
    this.required = false,
    this.obscureText,
    this.enable = true
    });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

    bool _obscureText = true;

    @override
    void initState() {
      super.initState();

      if(widget.obscureText != null){
        _obscureText = false;
      }
      
    }

  String? _validateField(String? value){
    if(value == null || value.isEmpty){
      return "Favor completar este campo";
    }
    return null;
  }
    
  @override
  Widget build(BuildContext context) {
        TextTheme textTheme = Theme.of(context).textTheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: textTheme.bodyLarge,
          enabled: widget.enable,
          controller: widget.controller,
          validator: widget.validator ?? _validateField,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText == null ? false : _obscureText,
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon),
            suffixIcon: widget.obscureText == null ? null 
            : IconButton( 
              icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off, ), 
              onPressed: () { 
                _obscureText = !_obscureText;
                setState(() {
                  
                });
              },
            ),
            // Icon( widget.obscureText? Icons.visibility : Icons.visibility_off),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGray
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkblue,
                width: 2
              ),
            ),
            // errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.yellow)),
            label: Text(widget.label),
            floatingLabelStyle: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            labelStyle: textTheme.labelLarge,
            errorStyle: textTheme.bodySmall?.copyWith(color: AppColors.red),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.red
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.red,
                width: 2
              ),
            ),
            
          ),
        ),
      ],
    );
  }
}