import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_order_input.dart';
import 'package:tst_app2/utils/theme.dart';

class ShowDialogForItemInput extends StatelessWidget {
   
  String productName;
  String image;
  String promoInfo;
  String itemCtn;
  String itemPcs;
  String discount;
  String eachValue;
   ShowDialogForItemInput({super.key,required this.productName,required this.image,
    required this.promoInfo,required this.itemCtn,required this.itemPcs,required this.discount,required this.eachValue});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctnController=TextEditingController();;
    TextEditingController pcsController=TextEditingController();;
    TextEditingController disountController= TextEditingController();
    return SizedBox(
      child: AlertDialog(
        insetPadding:const EdgeInsets.all(20),
         contentPadding: EdgeInsets.zero,
                  title:  Text(productName),
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                                 child: CachedNetworkImage(
                                  height: 150,
                                  // width: 100,
                                  //          height: 200,
                                               imageUrl:image,
                                               errorWidget: (context, url, error) =>const Icon(Icons.error),
                                             ),
                               ),
                               const SizedBox(height: 20,),
                          
                          
                                         Row(
                                           children: [
                                                     const Expanded(child: Text("Promo Info ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                     const Text(" :  "),
                                                      Expanded(flex: 3,
                                                       child:Text(promoInfo,style:const TextStyle(),))
                                           ],
                                         ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                          const  Expanded(child: Text("Orders  ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                    const Text(" :  "),
                                                     Expanded(flex: 3,
                                                      child: Row(
                                                        children: [
                                        Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.symmetric(horizontal: 8),
                                           child: TextFormFieldCustomOrderInput(
                                            
                                            controller:ctnController,
                                            hintText: "Ctn",borderColor: mainColor, validator: (value) {  }, 

                                           )
                                         )),
                                                        const  Text(" Ctn"),
                                       const SizedBox(width: 20,),
                                        Expanded(child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: TextFormFieldCustomOrderInput(
                                          controller: pcsController,
                                          hintText: "Pcs",
                                          borderColor: mainColor, validator: (value){
                                        //  //   int pcs = int.tryParse(value) ?? 0;
                                        //  //   int ctn = pcs ~/ int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //   int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //   if(givenCtnRatio<=pcs){
                                        //  //     pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                                        //  //    ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                                        //  //   }
                                        //  // double  eachCount1=0;
                                     
                                        //  //     String? ctnPrice= ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //    String? pcsPrice= pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //     String? dicountEach= discountControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //    double? ctnPriceEach=double.tryParse(ctnPrice)??0.0;
                                        //  //    double? pcsEachPrice=double.tryParse(pcsPrice)??0.0;
                                        //  //    double? discountEachPrice=double.tryParse(dicountEach)??0.0;
                                        //  //    double perctnPrice=ctnPriceEach*double.parse(tempBrand[index1].itemList[itemIndex].tradePrice)*int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //    double perPcsPrice =pcsEachPrice*double.parse(tempBrand[index1].itemList[itemIndex].tradePrice);
                                        //  //    eachCount1=perctnPrice+perPcsPrice;
                                        //  //    value=(eachCount1-discountEachPrice).toString();
                                     
                                     
                                     
                                          
                                        //  //   eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                        //  //     totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                            },

                                           ),
                                        //  child: TextFormField( 
                                        //    textDirection: TextDirection.rtl,
                                     
                                        //    decoration: InputDecoration(
                                        //         filled: true,
                                        //    fillColor: Colors.white,
                                        //    hintText: "Pcs",
                                        //    enabledBorder: UnderlineInputBorder(
                                        //    borderSide: BorderSide(
                                        //    width: 1, 
                                        //    color: mainColor,
                                        //                       ), 
                                        //                          ),
                                        //  ),
                                        //    //controller: pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                                         
                                        //   textAlign: TextAlign.center,
                                        //    keyboardType: TextInputType.number,
                                        //    onChanged: (value){
                                        //  //   int pcs = int.tryParse(value) ?? 0;
                                        //  //   int ctn = pcs ~/ int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //   int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //   if(givenCtnRatio<=pcs){
                                        //  //     pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                                        //  //    ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                                        //  //   }
                                        //  // double  eachCount1=0;
                                     
                                        //  //     String? ctnPrice= ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //    String? pcsPrice= pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //     String? dicountEach= discountControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text;
                                        //  //    double? ctnPriceEach=double.tryParse(ctnPrice)??0.0;
                                        //  //    double? pcsEachPrice=double.tryParse(pcsPrice)??0.0;
                                        //  //    double? discountEachPrice=double.tryParse(dicountEach)??0.0;
                                        //  //    double perctnPrice=ctnPriceEach*double.parse(tempBrand[index1].itemList[itemIndex].tradePrice)*int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                        //  //    double perPcsPrice =pcsEachPrice*double.parse(tempBrand[index1].itemList[itemIndex].tradePrice);
                                        //  //    eachCount1=perctnPrice+perPcsPrice;
                                        //  //    value=(eachCount1-discountEachPrice).toString();
                                     
                                     
                                     
                                          
                                        //  //   eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                        //  //     totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                        //    },
                                        //  ),
                                        ),
                                        ),
                                        
                                                       // const  Text(" pcs"),
                                                        ],
                                                      ))
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                         Row(
                                           children: [
                                                     const Expanded(child: Text("Discount ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                     const Text(" :  "),
                                                       Expanded(flex: 3,
                                                         child: Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 8),
                                         child: TextFormFieldCustomOrderInput(hintText: "Discount",borderColor: mainColor, controller: disountController, validator: (value){
                                          //   // int pcs = int.tryParse(value) ?? 0;
                                          //   // int ctn = (pcs / int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio)).ceil();
                                          //   // int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                          //   // if(givenCtnRatio<=pcs){
                                          //   //   pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                                          //   //  ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                                        
                                          //   // }
                                          //   // eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                            
                                          //   //   totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                            },

                                           ),
                                          // child: TextFormField( 
                                          //   textDirection: TextDirection.rtl,
                                     
                                          //   decoration: InputDecoration(
                                          //        filled: true,
                                          //   fillColor: Colors.white,
                                          //   hintText: "",
                                            
                                          //   enabledBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //   width: 1, 
                                          //   color: mainColor,
                                          //                      ), 
                                          //                         ),
                                          //   focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //   width: 1, 
                                          //   color: mainColor,
                                          //                      ), 
                                          //                         ),
                                          // ),
                                          //  // controller: discountControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                                          
                                          //  textAlign: TextAlign.center,
                                          //   keyboardType: TextInputType.number,
                                          //   onChanged: (value){
                                          //   // int pcs = int.tryParse(value) ?? 0;
                                          //   // int ctn = (pcs / int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio)).ceil();
                                          //   // int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                                          //   // if(givenCtnRatio<=pcs){
                                          //   //   pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                                          //   //  ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                                        
                                          //   // }
                                          //   // eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                            
                                          //   //   totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                          //   },
                                          // ),
                                        ),
                                        ),
                                           ],
                                         ),
                                         const SizedBox(height: 10,),
                                         const Row(
                                            children: [
                                                      Expanded(child: Text("Value ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                      Text(" :  "),
                                                       Expanded(flex: 3,
                                                        child: Text(""),
                                                       // child: Text(eachTotalCount(tempBrand , tempBrand[index1].itemList[itemIndex].itemId)),
                                                        // child: TextFormField( 
                                                        //         textDirection: TextDirection.rtl,
                                                        //         readOnly: true,
                                     
                                                        //         decoration:const InputDecoration(
                                                        //              filled: true,
                                                        //         fillColor: Colors.transparent,
                                                        //       //  hintText: "",
                                             
                                                        //         enabledBorder: UnderlineInputBorder(
                                                        //         borderSide: BorderSide(
                                                        //         width: 1, 
                                                        //         color: Colors.transparent,
                                                        //                            ), 
                                                        //                               ),
                                            
                                                        //       ),
                                                        //         controller: eachprice[tempBrand[index1].itemList[itemIndex].itemId],
                                           
                                                        //        textAlign: TextAlign.end,
                                                        //         keyboardType: TextInputType.number,
                                                        //         onChanged: (value){
                                            
                                                        //        // eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                             
                                                        //          // totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                                                        //         },
                                                        //       ),
                                                        )
                                            ],
                                          ),
                                     
                                         
                                         
                                         
                                         const SizedBox(height: 10,)
                                                         // SizedBox(
                                                         //               height: 250,
                                                         //               width: double.infinity,       
                                                         //               child: skuListData!.brandList.isNotEmpty? ListView.builder(
                                                         //                   scrollDirection: Axis.horizontal,
                                                         //                   shrinkWrap: true,
                                                         //                   itemCount: skuListData!.brandList[index1].itemList.length,
                                                         //                   itemBuilder: (context, index) {
                                                         //                     return Padding(
                                                         //                       padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                                         //                       child: InkWell(
                                                         //                         onTap: () {
                                                         //                           Navigator.push(
                                                         //                             context,
                                                         //                             MaterialPageRoute(
                                                         //                               builder: (context) => ProductDetailsScreen(
                                                         //                                 productDetail: skuListData!.brandList[index1].itemList[index],
                                                         //                               ),
                                                         //                             ),
                                                         //                           );
                                                         //                         },
                                                         //                         child: CardItemWidget(
                                                         //                           dealsname: skuListData!.brandList[index1].itemList[index].itemName,
                                                         //                           imageName: skuListData!.brandList[index1].itemList[index].itemAvatar,
                                                         //                           price: skuListData!.brandList[index1].itemList[index].invoicePrice,
                                                         //                        quantity   : skuListData!.brandList[index1].itemList[index].itemChain,
                                                         //                           quantityName: skuListData!.brandList[index1].itemList[index].itemUnit,
                                                         //                         ),
                                                         //                       ),
                                                         //                     );
                                                         //                   },
                                                         //                   ):const SizedBox(),
                                                         //             ),
                                          //const SizedBox(height: 30,)
                                          ],
                      ),
                    )
                  ),
                  actions: [
                    ElevatedButton(
                     // style: ,
                      onPressed: () {
                        // setState(() {
                        //   tableData.add({
                        //     'Brand': selectedBrand!,
                        //     'SKU': selectedSku ?? '',
                        //     'Reason': reason,
                        //     'Qty': qty,
                        //   });
                        // });
      
                        // selectedBrand = null;
                        // selectedSku = null;
                        // reason = '';
                        // qty = '';
      
                        // Navigator.of(context).pop();
                        // setState2(() {}); // Trigger a rebuild
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
    );
  }
}