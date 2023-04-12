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
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
      child: Container(
        height: 280,
        width: 160,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imageName,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                dealsname,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
