import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tst_app2/ui/themes/theme.dart';

class CardItemWidget extends StatefulWidget {
  final String price;
  final String id;
  final String imageName;
  final String dealsname;
  final String quantity;

  const CardItemWidget({
    Key? key,
    required this.price,
    required this.imageName,
    required this.dealsname,
    required this.quantity,
    required this.id,
  }) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  int itemQuantity = 0;
  bool animation = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    // padding: const EdgeInsets.fromLTRB(12, 5, 0, 0),

    return Container(
      // height: 150,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Stack(
            children: <Widget>[
              Image.asset(
                widget.imageName,
                width: 110,
                fit: BoxFit.scaleDown,
              ),
              Positioned(
                bottom: 2,
                left: animation == false
                    ? itemQuantity == 0
                        ? 65
                        : 0
                    : 65,
                right: 0,
                child: itemQuantity == 0
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            itemQuantity++;
                            Timer(const Duration(seconds: 2), () {
                              setState(() {
                                animation = true;

                                print(animation);
                              });
                            });
                          });
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.purple,
                          size: 36,
                        ),
                      )
                    : animation == false
                        ? Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.purple)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        itemQuantity--;
                                        Timer(const Duration(seconds: 5), () {
                                          setState(() {
                                            animation = true;

                                            print(animation);
                                          });
                                        });
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.purple,
                                      size: 20,
                                    )),
                                Text(
                                  itemQuantity.toString(),
                                  style: textTheme.bodySmall
                                      ?.copyWith(color: cOLORBlack),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemQuantity++;
                                      Timer(const Duration(seconds: 5), () {
                                        setState(() {
                                          animation = true;

                                          print(animation);
                                        });
                                      });
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.purple,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                animation = false;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Text(
                                itemQuantity.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
              ),
            ],
          ), // Expanded(

          const SizedBox(
            height: 18,
          ),
          Text(widget.price),
          const SizedBox(
            height: 5,
          ),
          Text(widget.dealsname,
              overflow: TextOverflow.ellipsis, style: textTheme.bodyMedium
              // const TextStyle(color: Colors.black, fontSize: 17),
              ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.quantity != "" ? Text(widget.quantity) : const Text("1kg"),
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
    );
  }

  // Widget animatedContainer(context) {
  //   return Text(itemQuantity.toString());
  // }
//   class animatedContainer extends StatelessWidget {
//   const animatedContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(itemQuantity.toString());
//   }
// }
}
