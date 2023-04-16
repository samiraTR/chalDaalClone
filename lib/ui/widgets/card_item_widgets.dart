import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CardItemWidget extends StatelessWidget {
  String price;
  String imageName;
  String dealsname;

  CardItemWidget({
    Key? key,
    required this.price,
    required this.imageName,
    required this.dealsname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        height: 240,
        width: 130,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack(
            //   children: [
            //     Positioned(
            //       child: Expanded(
            //         child: Image.asset(
            //           imageName,
            //           width: 110,
            //           fit: BoxFit.scaleDown,
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //         child: badges.Badge(
            //       badgeContent: Text("3"),
            //       position:
            //           badges.BadgePosition.bottomEnd(bottom: -10, end: -10),
            //     ))
            //   ],
            // ),
            Expanded(
              child: Image.asset(
                imageName,
                width: 110,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(price),
            const SizedBox(
              height: 5,
            ),
            Text(
              dealsname,
              maxLines: 2,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("1kg"),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.flash_on_sharp,
                      size: 15,
                      color: Colors.grey,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
