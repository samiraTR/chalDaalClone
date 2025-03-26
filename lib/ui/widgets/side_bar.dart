import 'package:flutter/material.dart';
import 'package:tst_app2/ui/themes/theme.dart';

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
    InputDecorationTheme inputDecoration = Theme.of(context).inputDecorationTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 232, 232),
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(
            //   color: const Color.fromARGB(255, 209, 204, 204),
            // ),
            boxShadow: [const BoxShadow(color: Colors.white)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Colors.green,
                child: Image.asset(
                  image,
                  height: 20,
                  width: 20,
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
