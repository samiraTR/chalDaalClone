import 'package:flutter/material.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  String hintText;
  Color borderColor;
  Color fillColor;
  final TextEditingController controller;
  final void Function(dynamic) onChanged; 
  
   SearchTextFormFieldWidget({super.key,required this.borderColor,required this.controller,required this.fillColor,required this.hintText,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
            
          ),
           prefixIcon:const Icon(Icons.search), 
          hintText: hintText, 
        
        ),
        
        onChanged: onChanged

      );
  }
}