import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/widgets/cancel_button_widget.dart';
import 'package:tst_app2/ui/widgets/confirm_button.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_order_input.dart';
import 'package:tst_app2/utils/theme.dart';

class ShowDialogForItemInput extends StatefulWidget {
 List<AllItem> savedData;
 AllItem? itemInfo;
 final ItemList itemList;
// Map<String,dynamic> callbackValue;
Function(AllItem?) callbackFunction;

  ShowDialogForItemInput({super.key,required this.savedData, required this.itemInfo,
  required this.itemList,required this.callbackFunction});

  @override
  State<ShowDialogForItemInput> createState() => _ShowDialogForItemInputState();
}

class _ShowDialogForItemInputState extends State<ShowDialogForItemInput> {
  String total="";
  bool isUpdate=false;
  TextEditingController ctnController=TextEditingController();
  TextEditingController pcsController=TextEditingController();
  TextEditingController disountController= TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.itemInfo!=null){
      pcsController.text=widget.itemInfo!.pcs!;
      ctnController.text=widget.itemInfo!.ctn!;
      disountController.text=widget.itemInfo!.discountInput!;
      total=widget.itemInfo!.totalPrice!;
      isUpdate=true;

    }
  }

  @override
  Widget build(BuildContext context) {
    
    
    return SizedBox(
      child: AlertDialog(
        insetPadding:const EdgeInsets.all(20),
         contentPadding: EdgeInsets.zero,
                  content: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                       const   SizedBox(height: 50,),
                          SizedBox(
                                 child: CachedNetworkImage(
                                  height: 120,
                                               imageUrl:widget.itemList.itemAvatar.toString(),
                                               errorWidget: (context, url, error) =>const Icon(Icons.error),
                                             ),
                               ),
                               const SizedBox(height: 10,),
                               Row(
                                           children: [
                                                     
                                                      Expanded(
                                                       child:Center(child: Text(widget.itemList.itemName.toString(),style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 16),)))
                                           ],
                                         ),
                                          const SizedBox(height: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: mainShadeColorNowMore
                                            
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10,),
                                                                                   Row(
                                             children: [
                                                        Expanded(child: Text("Promo Info",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14),)),
                                                       const Text(" :  "),
                                                        Expanded(flex: 3,
                                                         child:Text(widget.itemList.itemPromo.toString(),style: GoogleFonts.inter(),))
                                             ],
                                                                                   ),
                                                                                  const SizedBox(height: 10,),
                                                                                  Row(
                                            children: [
                                              Expanded(child: Text("Orders  ",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14),)),
                                                      const Text(" :  "),
                                                       Expanded(flex: 3,
                                                        child: Row(
                                                          children: [
                                                                                  Expanded(
                                                                                   child: Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 8),
                                             child: TextFormFieldCustomOrderInput( 
                                              controller:ctnController,
                                              hintText: "Ctn",
                                              
                                              
                                              borderColor: mainColor, 
                                              validator: (value) { 
                                                updateTotal();
                                                     }, 
                                          
                                             )
                                                                                   )),
                                                                                   Text(" Ctn",style: GoogleFonts.inter(fontSize: 14),),
                                                                                 const SizedBox(width: 20,),
                                                                                  Expanded(child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                                                  child: TextFormFieldCustomOrderInput(
                                                                                  controller: pcsController,
                                                                                  hintText: "Pcs",
                                                                                  borderColor: mainColor, 
                                                                                  validator: (value) {
                                                                                
                                             updateTotal();
                                              },
                                                                                   ),
                                                                                
                                            ),
                                                                                   ),
                                                                                  ],
                                                        ))
                                            ],
                                                                                  ),
                                                                                  const SizedBox(height: 10,),
                                                                                 Row(
                                             children: [
                                              Expanded(child: Text("Discount",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14),)),
                                             const Text(" :  "),
                                              Expanded(flex: 3,
                                                child: Padding(
                                                                                   padding: const EdgeInsets.symmetric(horizontal: 8),
                                                                                   child: TextFormFieldCustomOrderInput(
                                            hintText: "--Discount amount--",borderColor: mainColor, controller: disountController,
                                             
                                            
                                                                                   validator: (value) {
                                            double? dis= double.tryParse(disountController.text)??0.0;
                                            if((total=="")||(dis>double.parse(total))){
                                              AllServices().dynamicToastMessage("Discount must be less than total amount", Colors.red, Colors.white, 16);
                                              
                                            }
                                            updateTotal();
                                          
                                            
                                          
                                                     
                                                                                },
                                          
                                                                                   ),
                                                                                  
                                                                                  ),
                                                                                  ),
                                             ],
                                                                                   ),
                                                                                   const SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                        Expanded(child: Text("Value ",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14),)),
                                                       const Text(" :  "),
                                                         Expanded(flex: 3,
                                                          child: Text(total,style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14),),
                                                        
                                                          )
                                              ],
                                            ),
                                              const SizedBox(height: 10,),
                                              ],
                                            ),
                                          ),
                                        )
                        ],
                      ),
                    ),
                Positioned(
                      top: 17,
                      child: Container(
                        height: 35,
                        width: 160,
                        decoration: BoxDecoration(
                           color: widget.itemList.stockQty=="0"?const Color.fromARGB(255, 231, 36, 22): mainColor,
                          borderRadius:const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),),
                        ),
                        child:Center(child:  Text("Stock : ${widget.itemList.stockQty}",style: GoogleFonts.inter(color: white,fontSize: 13,fontWeight: FontWeight.bold),)),
                      ),
                    )

                      ],
                    ),
                    
                  ),
                  actions: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                     child: Row(
                          children: [
                            Expanded(child: CancelButtonWidget(buttonHeight: 50, fontColor: mainColor, buttonName: "Cancel", fontSize: 16, onTapFuction:  () { 
                              Navigator.pop(context) ;
                              
                            },borderColor: mainColor)),
                           const SizedBox(width: 10,),
                         widget.itemInfo!=null ? Expanded(child: ConfirmButtonWidget(buttonHeight: 50, fontColor: white, buttonName: "update", fontSize: 16, onTapFuction: () {
                            if(ctnController.text.isNotEmpty || pcsController.text.isNotEmpty){
                              widget.savedData.removeWhere((element) => element.itemId==widget.itemList.itemId);
                              addToCartMethod();

                            }
                            else{
                              AllServices().dynamicToastMessage("Please add something", Colors.red, white, 16);
                            }
                             

                             },))
                         : Expanded(child: ConfirmButtonWidget(buttonHeight: 50, fontColor: white, buttonName: "Add", fontSize: 16, onTapFuction: () {
                            if(ctnController.text.isNotEmpty || pcsController.text.isNotEmpty){
                              widget.savedData.removeWhere((element) => element.itemId==widget.itemList.itemId);
                              addToCartMethod();

                            }
                            else{
                              AllServices().dynamicToastMessage("Please add something", Colors.red, white, 16);
                            }
                             

                             },))
                           
                          ],
                        ),
                   ),
                   
                  ],
                ),
    );
  }

  void addToCartMethod(){
      AllItem? allItem ;
      Map<String,dynamic> callbackValue={};
    int ctn=(int.tryParse(ctnController.text)??0);
    int pcs= int.tryParse(pcsController.text)??0;
    if(ctn>0 || pcs>0){
      int? ctnWisePcs=  ctn* int.parse(widget.itemList.ctnPcsRatio.toString());
      double? total=(ctnWisePcs*double.parse(widget.itemList.tradePrice))+pcs;
      int? totalPcs=ctnWisePcs+pcs;
      // callbackValue={
      //   "pcsCount":pcs.toString(),
      //   "ctnCount":ctn.toString(),
      //   "discount":disountController.text.toString(),
      //   "totalPcs":totalPcs.toString(),
      //   "totalAmount":total.toString(),
      //   };
      allItem= AllItem(itemId: widget.itemList.itemId, 
         itemName: widget.itemList.itemName, 
         tradePrice: widget.itemList.tradePrice, 
         pcs: pcs.toString(), 
         ctn: ctn.toString(), totalPrice: total.toString(), discountInput: disountController.text.toString(), totalPcs: totalPcs.toString(), ctnPcsRatio: widget.itemList.ctnPcsRatio, itemAvatar: widget.itemList.itemAvatar);
       if(widget.savedData.isNotEmpty) {
               widget.savedData.removeWhere((element) => element.itemId==widget.itemList.itemId); 
          }
        widget.savedData.add(allItem);   
        widget.itemInfo=allItem;
          widget.callbackFunction(widget.itemInfo);

       }
         

       //  widget.callbackValue=callbackValue;
         //widget.callbackFunction(widget.itemInfo);
         Navigator.pop(context) ;

         
         
        //  CheckoutDataModel(cid: cid, userId: userId, userPass: userPass, deviceId: deviceId, clientId: clientId, clientName: clientName, orderDate: orderDate, orderTime: orderTime, deliveryDate: deliveryDate, deliveryTime: deliveryTime, paymentMode: paymentMode, latitude: latitude, longitude: longitude, allItem: allItem, offer: offer, rakList: rakList, note: note)
  }

  // void addtoModel(){
    
  // }

  void updateTotal() {
    setState(() {
      total = AllServices().getCountEachValue(
        widget.itemList,ctnController.text.toString(),pcsController.text.toString(),
        disountController.text.toString(),
      );
      
    });
  }
}