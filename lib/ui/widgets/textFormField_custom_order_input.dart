import 'package:flutter/material.dart';
import 'package:tst_app2/utils/theme.dart';

class TextFormFieldCustomOrderInput extends StatelessWidget {
  String hintText;
  Color borderColor;
  final TextEditingController controller;
  final void Function(dynamic) validator; 

  //final Function(String?)? onSaved;
   TextFormFieldCustomOrderInput({super.key,required this.hintText, required this.borderColor,required this.controller,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                                             textDirection: TextDirection.rtl,
                                              decoration: InputDecoration(
                                                filled: true,
                                           fillColor: Colors.transparent,
                                           hintText: hintText,
                                           enabledBorder: UnderlineInputBorder(
                                           borderSide: BorderSide(
                                           width: 1, 
                                           color: borderColor,
                                                              ), 
                                                                 ),
                                         ),
                                              
                                             //controller:  ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                                             textAlign: TextAlign.center,
                                             keyboardType: TextInputType.number,
                                             onChanged: ((value) {
                                     
                                               // eachTotalCount(tempBrand,index1,itemIndex,tempBrand[index1].itemList[itemIndex].itemId);
                                               
                                             //  totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                             
                                               
                                             }),
                                         
                                                             
                                                             
                                                               );
  }
}