import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/oultet_list_.dart';
import 'package:tst_app2/ui/widgets/Flavour_wise_each_item_widget.dart';
import 'package:tst_app2/utils/theme.dart';


class FlavourWiseitemListScreen extends StatefulWidget {

  List<ItemList> itemList;
   FlavourWiseitemListScreen({
    required this.itemList,
    super.key});
    
  @override
  State<FlavourWiseitemListScreen> createState() => _FlavourWiseitemListScreenState();
}

class _FlavourWiseitemListScreenState extends State<FlavourWiseitemListScreen> {
    RetStr? skuListData;
    bool isItemTile=true;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Product"),
        actions: [
          GestureDetector(
            onTap: (){
                isItemTile=!isItemTile;
                setState(() { });              

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               decoration: BoxDecoration(
                 color: mainColor,
                 borderRadius: BorderRadius.circular(5)
               ),
                child:Image.asset(isItemTile?"assets/icons/grid.png":"assets/icons/listTile.png",color:white, height: 20,)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child:isItemTile? Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.itemList.length,
        itemBuilder: (BuildContext context, int itemIndex) {
          return ExpansionTile(
            leading:  SizedBox(
              width: 70,
                  child: CachedNetworkImage(
                    height: 100,
                        imageUrl:widget.itemList[itemIndex].itemAvatar,
                        errorWidget: (context, url, error) =>const Icon(Icons.error),
                      ),
                ),
            title: Text(widget.itemList[itemIndex].itemName),
            subtitle: Text('Price: ${widget.itemList[itemIndex].invoicePrice}'),
            children: [
              Padding(
                padding:const  EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                   const Expanded(child: Text("Promo Info ",style: TextStyle(fontWeight: FontWeight.bold),)),
                   const Text(" :  "),
                     Expanded(flex: 3,
                      child:Text(widget.itemList[itemIndex].itemPromo,style:const TextStyle(),))
                  ],
                ),
              ),
               Padding(
                padding:const  EdgeInsets.only(left: 20,top: 8),
                child: Row(
                  children: [
                  const  Expanded(child: Text("Orders  ",style: TextStyle(fontWeight: FontWeight.bold),)),
                   const Text(" :  "),
                     Expanded(flex: 3,
                      child: Row(
                        children: [
                          Expanded(child: TextFormField(
                            decoration:const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "ctn"
                  ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                            

                          )),
                        const  Text(" ctn"),
                         const SizedBox(width: 20,),
                          Expanded(child: TextFormField(
                             decoration:const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "pcs"
                  ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                          )),
                        const  Text(" pcs"),
                        ],
                      ))
                  ],
                ),
              ),
              const  Padding(
                padding:  EdgeInsets.only(left: 20,top:8 ),
                child: Row(
                  children: [
                    Expanded(child: Text("Value ",style: TextStyle(fontWeight: FontWeight.bold),)),
                    Text(" :  "),
                     Expanded(flex: 3,
                      child: Text("120 ",style: TextStyle(),))
                  ],
                ),
              ),
              
              
              const SizedBox(height: 10,)


             
            ],
          );
        },
      ),
    ): SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
            shrinkWrap: true,
            itemCount: widget.itemList.length,
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.8
            ),
            itemBuilder: (BuildContext context, int itemIndex) {
                  return FlavourWiseEachItem(
                            dealsname:widget.itemList[itemIndex].itemName,
                            imageName: widget.itemList[itemIndex].itemAvatar,
                            price: widget.itemList[itemIndex].invoicePrice,
                                                     quantity   : widget.itemList[itemIndex].itemChain,
                            quantityName: widget.itemList[itemIndex].itemUnit,
                          );
              
             
            },
          )
                    
                    ),
                  ),
      ),
      bottomNavigationBar:Container(
                    color: white,
                    child: GestureDetector(
                      onTap: (() {
                             Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => CutomerListScreen(fromScreenName: 'flavourWiseItemList',)
                                     )));
                        

                      }),
                      child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                
                                    
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Container(
                                            height: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                    color:const Color.fromARGB(255, 61, 80, 251),
                                                
                                                ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                     flex: 1,
                                                  child: Container(
                                                      width: 45.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child:const Center(child:  Text("10",style: TextStyle(color: Colors.white),)),
                                                    ),
                                                ),
                    
                                               const Expanded(
                                                  flex: 4,
                                                  child:  Center(
                                                    child: Text(
                                                      "Add Customer",
                                                      style: textSTYLEHeadline16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                     flex: 2,
                                                  child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                      color: mainColor,
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            "    ৳400     ",
                                                            style: textSTYLEHeadline15,
                                                          ),
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                             
                              ],
                            ),
                    ),
                  ) ,
    );
  }
}