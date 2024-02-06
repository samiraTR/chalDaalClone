import 'package:flutter/material.dart';

class LoginTextFOrmFiledWidget extends StatelessWidget {
  String hintText;
  Color borderColor;
  Color fillColor;
  final TextEditingController controller;
  final void Function(dynamic) onChanged; 
  
   LoginTextFOrmFiledWidget({super.key,required this.borderColor,required this.controller,required this.fillColor,required this.hintText,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
            
          ),
         
          hintText: hintText, 
        
        ),
        
        onChanged: onChanged

      );
  }
}