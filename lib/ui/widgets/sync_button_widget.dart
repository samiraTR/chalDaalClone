// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/utils/theme.dart';

class SyncButtonWidget extends StatefulWidget {
  Color buttonbackgroudColor;
  double buttonRadiousMea ;
  String image;
  double imageHeight;
  double imagewidth;
  String buttonName;
  Color textColor;
final void Function() onpressedFuc;
  

   SyncButtonWidget({
    Key? key,
    required this.buttonbackgroudColor,
    required this.buttonRadiousMea,
    required this.image,
    required this.imageHeight,
    required this.imagewidth,
    required this.buttonName,
    required this.textColor,
    required this.onpressedFuc
  }) : super(key: key);

  @override
  State<SyncButtonWidget> createState() => _SyncButtonWidgetState();
}

class _SyncButtonWidgetState extends State<SyncButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                     onTap: ()  {
                      widget.onpressedFuc();
                           
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.buttonbackgroudColor,
                        borderRadius: BorderRadius.circular(widget.buttonRadiousMea),
                        boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.1), // Change the shadow color and opacity as needed
              spreadRadius: 1, // Spread radius
              blurRadius: 4, // Blur radius
              offset:const Offset(0, 6), // Offset from the container
            ),
          ],
                      ),
                       child: Column(children: [
                        Image.asset(widget.image,height: widget.imageHeight,width: widget.imagewidth,),
                        Padding(
                          padding:const  EdgeInsets.only(bottom: 10),
                          child: Text(widget.buttonName, 
                           style: GoogleFonts.inter(
                              color: mainColor,fontWeight: FontWeight.w500
                            ),
                          // style: TextStyle(color: widget.textColor,fontWeight: FontWeight.w400),
                          ),
                        )
                                  
                       ]) ,
                    ),
                  );
  }
}
