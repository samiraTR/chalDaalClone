import 'package:flutter/material.dart';

import 'package:tst_app2/utils/theme.dart';

class TextFormFieldCustomWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(dynamic) onChnaged; 

   TextFormFieldCustomWidget({super.key,required this.controller,required this.onChnaged});

  @override
  Widget build(BuildContext context) {
    return  Container(
                                  decoration:  BoxDecoration(
                                    color: mainShadeColorNow,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border:  Border.all(
                                      color: mainShadeColorNow,
                                      width: 1,
                                    ),
                                  ),
                                  child:  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller:controller ,
                                    decoration:  InputDecoration(
                                      
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintText: '',
                                      border: InputBorder.none,
                            
                                    ),
                                    onChanged: onChnaged,
                                  ),
                                );
  }
}