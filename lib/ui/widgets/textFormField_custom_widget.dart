import 'package:flutter/material.dart';

import 'package:tst_app2/utils/theme.dart';

class TextFormFieldCustomWidget extends StatelessWidget {

  const TextFormFieldCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border:  Border.all(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                  ),
                                  child:const  TextField(
                                    textAlign: TextAlign.center,
                                    decoration:  InputDecoration(
                                      
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintText: '',
                                      border: InputBorder.none,
                            
                                    ),
                                  ),
                                );
  }
}