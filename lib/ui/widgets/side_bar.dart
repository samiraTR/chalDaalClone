import 'package:flutter/material.dart';
import 'package:tst_app2/themes/theme.dart';

class SideBarWidget extends StatelessWidget {
  String image;
  String barName;
  SideBarWidget({
    Key? key,
    required this.image,
    required this.barName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
      child: Container(
        height: 60,
        width: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 232, 232),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 209, 204, 204),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green,
                child: Image.asset(
                  image,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              barName,
              style: textTheme.titleSmall?.copyWith(color: cOLORBlack),
            )
          ],
        ),
      ),
    );
  }
}
