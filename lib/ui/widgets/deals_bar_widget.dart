import 'package:flutter/material.dart';

class DealSHorizontalBarWidget extends StatelessWidget {
  String imageName;
  String dealsname;
  Color color;
  DealSHorizontalBarWidget({
    Key? key,
    required this.imageName,
    required this.dealsname,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 5, 3, 5),
      child: Stack(
        children:[ Container(
          height: 210,
          width: 120,
          // decoration: inputDecoration,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(10) ,
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.94),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     dealsname,
              //     style: const TextStyle(color: Colors.white, fontSize: 17),
              //   ),
              // )
            ],
          ),
        ),
         Positioned(
          bottom: 0,
           child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  dealsname,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
         )
        
        
        ]
      ),
    );
  }
}
