
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/widgets/cancel_button_widget.dart';
import 'package:tst_app2/ui/widgets/confirm_button.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_order_input.dart';
import 'package:tst_app2/utils/theme.dart';

class ShowDialogForOrderEdit extends StatefulWidget {
 final AllItem itemList;
  Map<String,dynamic> callbackValue;
  Function callbackFunction;

  ShowDialogForOrderEdit({super.key,required this.itemList, required this.callbackValue,required this.callbackFunction});

  @override
  State<ShowDialogForOrderEdit> createState() => _ShowDialogForOrderEditState();
}

class _ShowDialogForOrderEditState extends State<ShowDialogForOrderEdit> {
  String total="";
  TextEditingController ctnController=TextEditingController();
  TextEditingController pcsController=TextEditingController();
  TextEditingController disountController= TextEditingController();
  
@override
  void initState() {
    super.initState();
    ctnController.text=widget.itemList.ctn!;
    pcsController.text=widget.itemList.pcs!;
    disountController.text=widget.itemList.discountInput!;
    total=widget.itemList.totalPrice!;
  
  }
  @override
  Widget build(BuildContext context) { 
    return SizedBox(
      child: AlertDialog(
        insetPadding:const EdgeInsets.all(20),
         contentPadding: EdgeInsets.zero,
                  title:  Text(widget.itemList.itemName.toString()),
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                         
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
                                                     const Expanded(child: Text("Promo Info",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                     const Text(" :  "),
                                                      Expanded(flex: 3,
                                                       child:Text(widget.itemList.itemPromo==null?"":widget.itemList.itemPromo.toString(),style:const TextStyle(),))
                                           ],
                                         ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                          const  Expanded(child: Text("Orders",style: TextStyle(fontWeight: FontWeight.bold),)),
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
                                                        const  Text(" Ctn"),
                                       const SizedBox(width: 20,),
                                        Expanded(child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: TextFormFieldCustomOrderInput(
                                        controller: pcsController,
                                        hintText: "Pcs",
                                        borderColor: mainColor, 
                                        validator: (value) {
                                          updateTotal() ;
                                        
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
                                           const Expanded(child: Text("Discount",style: TextStyle(fontWeight: FontWeight.bold),)),
                                           const Text(" :  "),
                                            Expanded(flex: 3,
                                              child: Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 8),
                                         child: TextFormFieldCustomOrderInput(hintText: "Discount",borderColor: mainColor, controller: disountController, 
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
                                                     const Expanded(child: Text("Value",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                     const Text(" :  "),
                                                       Expanded(flex: 3,
                                                        child: Text(total.toString()),
                                                      
                                                        )
                                            ],
                                          ),
                        ],
                      ),
                    )
                  ),
                  actions: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
                     child: Row(
                          children: [
                            Expanded(child: CancelButtonWidget(buttonHeight: 50, fontColor: mainColor, buttonName: "Cancel", fontSize: 16, onTapFuction:  () { 
                              Navigator.pop(context) ;
                              
                            },borderColor: mainColor)),
                           const SizedBox(width: 10,),
                           Expanded(child: ConfirmButtonWidget(buttonHeight: 50, fontColor: white, buttonName: "Update", fontSize: 16, onTapFuction: () {
                             addToCartMethod();

                             },))
                           
                          ],
                        ),
                   ),
                   
                  ],
                ),
    );
  }

  void addToCartMethod(){
    int ctn=((int.tryParse(ctnController.text)??0)* int.parse(widget.itemList.ctnPcsRatio!));
    int pcs= int.tryParse(pcsController.text)??0;
    int? totalPcs=ctn+pcs;
     Map<String,dynamic> callbackValue={
        "pcsCount":pcs.toString(),
        "ctnCount":ctn.toString(),
        "discount":disountController.text.toString(),
        "totalAmount":total.toString(),

        "addItem":AllItem(itemId: widget.itemList.itemId, 
         itemName: widget.itemList.itemName, 
         tradePrice: widget.itemList.tradePrice, 
         pcs: pcs.toString(), 
         ctn: ctn.toString(), totalPrice: total, discountInput: disountController.text.toString(), totalPcs: totalPcs.toString(), ctnPcsRatio: widget.itemList.ctnPcsRatio, itemAvatar: widget.itemList.itemAvatar)

         };

         widget.callbackValue=callbackValue;
         widget.callbackFunction(widget.callbackValue);
         Navigator.pop(context) ;
        
         
         
        //  CheckoutDataModel(cid: cid, userId: userId, userPass: userPass, deviceId: deviceId, clientId: clientId, clientName: clientName, orderDate: orderDate, orderTime: orderTime, deliveryDate: deliveryDate, deliveryTime: deliveryTime, paymentMode: paymentMode, latitude: latitude, longitude: longitude, allItem: allItem, offer: offer, rakList: rakList, note: note)
  }

  // void addtoModel(){
    
  // }

  void updateTotal() {
    setState(() {
      total = AllServices().updateItemAmount(
        widget.itemList,ctnController.text.toString(),pcsController.text.toString(),
        disountController.text.toString(),
      );
    });
  }
}