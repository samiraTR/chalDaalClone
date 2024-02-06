import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/utils/theme.dart';

class TextFormFieldCustomOrderInput extends StatelessWidget {
  String hintText;
  Color borderColor;
  final TextEditingController controller;
  final void Function(dynamic) validator; 

   TextFormFieldCustomOrderInput({super.key,required this.hintText, required this.borderColor,required this.controller,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                                             textDirection: TextDirection.rtl,
                                              decoration: InputDecoration(
                                                filled: true,
                                           fillColor: Colors.transparent,
                                           hintText: hintText,
                                           hintStyle: GoogleFonts.inter(),
                                           enabledBorder: UnderlineInputBorder(
                                           borderSide: BorderSide(
                                           width: 1, 
                                           color: borderColor,
                                                              ), 
                                                                 ),
                                         ),
                                              
                                             controller:  controller,
                                             textAlign: TextAlign.left,
                                             style: GoogleFonts.inter(),
                                             keyboardType: TextInputType.number,
                                             onChanged: validator
                                         
                                                             
                                                             
                                                               );
  }
}