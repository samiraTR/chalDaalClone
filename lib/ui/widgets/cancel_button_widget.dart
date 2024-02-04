
import 'package:flutter/widgets.dart';
import 'package:tst_app2/utils/theme.dart';

class CancelButtonWidget extends StatelessWidget {
  double buttonHeight;
  String buttonName;
  double fontSize;
  Color fontColor;
    Color borderColor;
    final void Function() onTapFuction;  


   CancelButtonWidget({super.key,required this.buttonHeight,required this.fontColor,required this.buttonName,required this.fontSize,required this.onTapFuction,required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFuction,
      child: Container(
                              height: buttonHeight,
                              
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,

                                  color: borderColor
                                )
                              ),
                              child:Center(child:  Text(buttonName,style: TextStyle(color: fontColor,fontSize: fontSize,fontWeight: FontWeight.bold),)),
                            ),
    );
  }
}