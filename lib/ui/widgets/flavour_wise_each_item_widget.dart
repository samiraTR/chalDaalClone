import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/utils/theme.dart';

class FlavourWiseEachItem extends StatefulWidget {
  final String price;
  final String imageName;
  final String dealsname;
  final String quantity;
  final String quantityName;


  const FlavourWiseEachItem({
    Key? key,
    required this.price,
    required this.imageName,
    required this.dealsname,
    required this.quantity,
    required this.quantityName,
  }) : super(key: key);

  @override
  State<FlavourWiseEachItem> createState() => _flavourWiseEachItemState();
}

class _flavourWiseEachItemState extends State<FlavourWiseEachItem> {
  int itemQuantity = 0;
  bool animation = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    

    return Container(
     
      height: 130,
      //width: 130,
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 18,
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: CachedNetworkImage(
                    height: 100,
                        imageUrl:widget.imageName,
                        errorWidget: (context, url, error) =>const Icon(Icons.error),
                      ),
                ),
              ),
              Positioned(
                bottom: 2,
                left:animation == false
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
                        child:  Icon(
                          Icons.add_circle,
                          color: mainColor,
                          size: 36,
                        ),
                      )
                    : animation == false
                        ? Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: mainColor)),
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
                                    icon:  Icon(
                                      Icons.remove_circle,
                                      color: mainColor,
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
                                      Timer(const Duration(seconds: 2), () {
                                        setState(() {
                                          animation = true;
                                          print(animation);
                                        });
                                      });
                                    });
                                  },
                                  icon:  Icon(
                                    Icons.add_circle,
                                    color: mainColor,
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
                              backgroundColor: mainColor,
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
            height: 4,
          ),
          Expanded(child: Align(
            alignment: Alignment.centerLeft,
            child: Text("৳${widget.price}",style:const TextStyle(color: Color.fromARGB(255, 243, 109, 109),fontWeight: FontWeight.bold),))),
          const SizedBox(
            height: 5,
          ),
          Text(widget.dealsname.trim(),
              
              ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.quantity != "" ? Text("${widget.quantity}  ${widget.quantityName}",style:const  TextStyle(fontSize: 10),) : const Text("1kg"),
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
