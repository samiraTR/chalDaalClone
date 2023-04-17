// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        height: 240,
        width: 130,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(dealsname,
                overflow: TextOverflow.ellipsis, style: textTheme.bodyMedium
                // const TextStyle(color: Colors.black, fontSize: 17),
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
