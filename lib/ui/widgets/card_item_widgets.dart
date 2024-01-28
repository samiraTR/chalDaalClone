import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/model/sku_list_model.dart';

import 'package:tst_app2/utils/theme.dart';

class CardItemWidget extends StatefulWidget {
  ItemList itemList;
  // final String price;
  // final String imageName;
  // final String dealsname;
  // final String quantity;
  // final String quantityName;

   CardItemWidget({
    Key? key,
    required this.itemList
    // required this.price,
    // required this.imageName,
    // required this.dealsname,
    // required this.quantity,
    // required this.quantityName,
  }) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  int itemQuantity = 0;
  bool isInitial= true;
  bool animation = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    

    return Container(
      // height: 150,
      width: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  height: 100,
                      imageUrl:widget.itemList.itemAvatar,
                      errorWidget: (context, url, error) =>const Icon(Icons.error),
                    ),
              ),
   Positioned(
      bottom: 2,
      left: animation == false ? (isInitial==true ? 65 : 0) : 65,
      right: 0,
      child:( isInitial==true && animation == false)
          ? InkWell(
              onTap: () {
                setState(() {
                 // itemQuantity = 0;
                   animation = true;
                    isInitial=false;
                  // Timer(const Duration(seconds: 1), () {
                  //   animation = true;
                  //     isInitial=false;
                  //     print(animation);
                  //     print("1");
                  //   setState(() {
                      
                  //   });
                  // });
                });
              },
              child: Icon(
                Icons.add_circle,
                color: mainColor,
                size: 30,
              ),
            )
          : ((animation == false && isInitial==false)
              ? Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: mainColor), 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (itemQuantity > 0) {
                              itemQuantity =itemQuantity+int.parse(widget.itemList.itemChain);
                               }
                              Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  animation = true;
                                     isInitial=false;
                                  print(animation);
                                });
                              });
                           
                          });
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: mainColor,
                          size: 20,
                        ),
                      ),
                      Text(
                        itemQuantity.toString(),
                        style:const TextStyle(color: Colors.black), 
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            itemQuantity += 10; 
                            Timer(const Duration(seconds: 1), () {
                              setState(() {
                                animation = true;
                                print(animation);
                              });
                            });
                          });
                        },
                        icon: Icon(
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
                    //  Timer(const Duration(seconds: 1), () {
                    //             setState(() {
                    //               animation = true;
                    //                  isInitial=false;
                    //               print(animation);
                                  
                    //             });
                    //           });


                    setState(() {
                      animation = false;
                       print("laset");
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: mainColor, 
                    child: Text(
                      itemQuantity.toString(),
                      style:const TextStyle(color: Colors.white), 
                    ),
                  ),
                )),
    )
            ],
          ), // Expanded(

          const SizedBox(
            height: 4,
          ),
          Expanded(child: Text("৳${widget.itemList.invoicePrice}",style:const TextStyle(color: Color.fromARGB(255, 243, 109, 109),fontWeight: FontWeight.bold),)),
          const SizedBox(
            height: 5,
          ),
          Text(widget.itemList.itemName.trim(),
              // overflow: TextOverflow.ellipsis, style: textTheme.bodyMedium
              // const TextStyle(color: Colors.black, fontSize: 17),
              ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text("1",style:  TextStyle(fontSize: 10),) ,
              IconButton(
                  onPressed: (() {
                    
                  }),
                  icon:const  Icon(
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
