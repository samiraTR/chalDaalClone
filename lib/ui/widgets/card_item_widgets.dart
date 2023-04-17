import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class CardItemWidget extends StatefulWidget {
  String price;
  String imageName;
  String dealsname;
  String quantity;

  CardItemWidget({
    Key? key,
    required this.price,
    required this.imageName,
    required this.dealsname,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  int itemQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        height: 280,
        width: 130,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: badges.Badge(
                badgeContent: itemQuantity == 0
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            print(itemQuantity);
                            itemQuantity++;
                          });
                        },
                        child: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.purple,
                          size: 36,
                        ),
                      )
                    : Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.purple)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 3,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemQuantity--;
                                    });
                                    print(itemQuantity);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.purple,
                                  )),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(itemQuantity.toString()),
                            const SizedBox(
                              width: 2,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemQuantity++;
                                  });
                                },
                                icon: Icon(Icons.add)),
                          ],
                        ),
                      ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                position: itemQuantity == 0
                    ? badges.BadgePosition.bottomEnd(bottom: -8, end: -10)
                    : badges.BadgePosition.bottomEnd(bottom: -25, end: -5),
                child: Image.asset(
                  widget.imageName,
                  width: 110,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(widget.price),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.dealsname,
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
                Text(widget.quantity),
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
