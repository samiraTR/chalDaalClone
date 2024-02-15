import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/ui/market_return_screen_new.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/oultet_list_.dart';
import 'package:tst_app2/ui/posm_screen.dart';
import 'package:tst_app2/ui/widgets/cancel_button_widget.dart';
import 'package:tst_app2/ui/widgets/showDialog_for_order_edit.dart';
import 'package:tst_app2/utils/theme.dart';

class OrderConfirmationScreen extends StatefulWidget {
  CheckoutDataModel chekoutDataModel;
   OutletReturnList clientInfo;
   int outletIndex;
   Client clientDetails;
  
   OrderConfirmationScreen({Key? key,required this.chekoutDataModel,required this.clientInfo,required this.outletIndex,required this.clientDetails}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();

}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  double totalAmount=0;
  double discountTotal=0;
   @override
  void initState() {
    // getAllItemfromBox();
    getTotalData();
    super.initState();
  }
  //  getAllItemfromBox(){
  //   final orderSavedData = Boxes.outletWiseItemSaved();
  //   orderSavedData.toMap().values.forEach((element) {
  //       if(element.clientId== widget.clientDetails.clientId)  {}
     

  //   });
    


  // }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Orders",style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              color: mainColor,
                height: 15000,
             
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                border: Border.all(
                  width: 1,color: white
                ),borderRadius: BorderRadius.circular(15)

              ),
                      child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Align(alignment: Alignment.centerLeft,
                                    child: Text("Shop Name",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),),
                                ),
                              //  const SizedBox(width: 13),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    widget.clientDetails.clientName,
                                    style: TextStyle(color: white, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: 
                                      
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CutomerListScreen(
                                                fromScreenName: 'order_confirm',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.edit, color: white),
                                      ),
                                    
                                )
                              ],
                            ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(alignment: Alignment.centerLeft,
                                child: Text("Owner Name",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),),
                            ),
                          //  const SizedBox(width: 13),
                            Expanded(
                              flex: 5,
                              child: Text(
                                widget.clientDetails.ownerName.toString(),
                                style: TextStyle(color: white, fontSize: 15),
                              ),
                            ),
                          const  Expanded(
                              child: Text("") 
                            )
                          ],
                        ),
                                           const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(alignment: Alignment.centerLeft,
                                child: Text("Mobile No",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),),
                            ),
                          //  const SizedBox(width: 13),
                            Expanded(
                              flex: 5,
                              child: Text(
                                widget.clientDetails.contactNo1,
                                style: TextStyle(color: white, fontSize: 15),
                              ),
                            ),
                           const Expanded(
                              child: Text("")
                                  
                                  
                                
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(alignment: Alignment.centerLeft,
                                child: Text("Last 3 sales",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),),
                            ),
                          //  const SizedBox(width: 13),
                            Expanded(
                              flex: 5,
                              child: Text(
                                "1,20,00,00",
                                style: TextStyle(color: white, fontSize: 15),
                              ),
                            ),
                           const Expanded(
                              child: Text("")
                                  
                                  
                                
                            )
                          ],
                        ),
                         const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(alignment: Alignment.centerLeft,
                                child: Text("Gross Rate",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,color: white,fontSize: 16),),
                            ),
                          //  const SizedBox(width: 13),
                            Expanded(
                              flex: 5,
                              child: Text(
                                "90%",
                                style: TextStyle(color: white, fontSize: 15),
                              ),
                            ),
                           const Expanded(
                              child: Text("")
                                  
                                  
                                
                            )
                          ],
                        ),
                       // SizedBox(height: 4,)
                          ],
                        ),
                      ),
                    ),
                     SizedBox(height: 4,)
              
                    
                    
                  ],
                ),
              ),
            ),
            Positioned(
                top: 190,
              child: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                
                child: Container(
                 // height: MediaQuery.of(context).size.height,
                    height: 15000,
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(
                      children: [
                    //     Padding(
                    // padding: const EdgeInsets.only(top: 10),
                    // child: Row(
                    //   children: [
                    //     // Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                        
                    //     Expanded(flex: 8,
                    //       child:  Text("Market Return ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
                    //       Expanded(flex: 2,
                    //         child: ElevatedButton(
                    //            style: ElevatedButton.styleFrom(primary: mainColor),
                    //           onPressed: (){
                    //             Navigator.push(
                    // context,
                    // (MaterialPageRoute(
                    //   builder: (context) => MarketReturnScreen())));
                        
                    //           },child:const Text("ADD"),)),
                    //   ],
                    // ),
                    // ),
                    // Padding(
                    // padding: const EdgeInsets.only(top: 4),
                    // child: Row(
                    //   children: [
                      
                        
                    //     Expanded(flex: 8,
                    //       child:  Text("POSM ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
                    //       Expanded(flex: 2,
                    //         child: ElevatedButton(
                    //            style: ElevatedButton.styleFrom(primary: mainColor),
                    //           onPressed: (){
                    //              Navigator.push(
                    // context,
                    // (MaterialPageRoute(
                    //   builder: (context) => POSMScreen())));
                    //           },child:const Text("ADD"),)),
                    //   ],
                    // ),
                    // ),
                    
                    Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Expanded(flex: 8,
                          child: Text("Order Summery ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),)),
                          Expanded(child: IconButton(icon: const Icon(Icons.edit),onPressed: () {
                            Navigator.pop(context);
                    //         Navigator.push(
                    // context,
                    // (MaterialPageRoute(
                    //   builder: (context) => PageControllerScreen(bottomNav: 1,))));
                    //          Navigator.push(
                    // context,
                    // (MaterialPageRoute(
                    //   builder: (context) => PageControllerScreen(bottomNav: 1,))));
                            
                          },))
                      ],
                    ),
                    ),
                    SizedBox(
                    height: widget.chekoutDataModel.allItem.length*45,
                    
                    child: ListView.builder(
                      itemCount:widget.chekoutDataModel.allItem.length ,
                      itemBuilder: ((context, index) {

                    return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: (){
                        showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return Theme(
                           data: ThemeData(
                             dialogBackgroundColor: Colors.white,
                             dialogTheme: DialogTheme(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(16.0),
                               ),
                             ),
                           ),
                           child: StatefulBuilder(
                             builder: (BuildContext context, StateSetter setState2) {
                              Map<String,dynamic> callbackValue={
                                "pcsCount":"",
                                "discount":"",
                                "totalAmount":"",
                               };
                               return ShowDialogForOrderEdit(
                                itemList:widget.chekoutDataModel.allItem[index], callbackValue:callbackValue, 
                                callbackFunction:(value){
                                  widget.chekoutDataModel.allItem[index].totalPrice=value["totalAmount"].toString();
                                
                                 setState2;
                                  setState(() {
                                    
                                  });
                                  } ,
                                
                                );
                     

                                
                             },
                           ),
                         );
                       },
                     );
                       
                        
                        
                        
                      },
                      child: Row(
                        children: [
                           Expanded(child: Text("${index+1}.",style: TextStyle(fontSize: 14,color: blackColor),)),
                           Expanded(flex: 6,
                            child: Text(widget.chekoutDataModel.allItem[index].itemName.toString(),style: TextStyle(fontSize: 15,color: blackColor),)),
                            Expanded(flex: 2,
                              child: Center(child: Text("${widget.chekoutDataModel.allItem[index].totalPcs} pc",style: TextStyle(fontSize: 14,color: blackColor),))),
                            Expanded(flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("TK ${widget.chekoutDataModel.allItem[index].totalPrice}",style: TextStyle(fontSize: 14,color: blackColor),))),
                        ],
                      ),
                    ),
                    );
                      
                    })),
                    )
                    
                     , const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Divider(thickness: 2,),
                    ),
                  
                    Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Expanded(flex: 9,
                          child: Text("Subtotal",style: TextStyle(fontSize: 16,color: blackColor),)),
                          Expanded(flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("TK ${totalAmount.toString()}",style: TextStyle(fontSize: 14,color: blackColor),))),
                      ],
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(flex: 12,
                          child: Text("Discount",style: TextStyle(fontSize: 16,color: blackColor),)),
                          Expanded(flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("TK $discountTotal",style: TextStyle(fontSize: 14,color: blackColor),))),
                      ],
                    ),
                    ),
                     const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Divider(thickness: 2,),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Expanded(flex: 9,
                          child: Text("Total",style: TextStyle(fontSize: 16,color: blackColor,fontWeight: FontWeight.bold),)),
                          Expanded(flex: 3,
                            child: Align(alignment: Alignment.centerRight,
                              child: Text("TK ${totalAmount.toString()} ",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.bold),))),
                      ],
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Expanded(flex: 8,
                          child: Text("Market Return",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),)),
                          Expanded(child: IconButton(icon: const Icon(Icons.edit),onPressed: () {
                             Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => MarketReturnScreenNew(routingFrom: "MR", total: "", clientInfo: widget.clientInfo, outletIndex: widget.outletIndex))));
                            
                          },))
                      ],
                    ),
                    ),
                    SizedBox(
                    height: widget.chekoutDataModel.allItem.length*45,
                    
                    child: ListView.builder(
                      itemCount:widget.chekoutDataModel.allItem.length ,
                      itemBuilder: ((context, index) {
                       return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: (){
                        
                      },
                      child: Row(
                        children: [
                           Expanded(child: Text("${index+1}.",style: TextStyle(fontSize: 14,color: blackColor),)),
                           Expanded(flex: 6,
                            child: Text(widget.chekoutDataModel.allItem[index].itemName.toString(),style: TextStyle(fontSize: 15,color: blackColor),)),
                            Expanded(flex: 2,
                              child: Center(child: Text("${widget.chekoutDataModel.allItem[index].totalPcs} pc",style: TextStyle(fontSize: 14,color: blackColor),))),
                            Expanded(flex: 3,
                              child: Align(alignment: Alignment.centerRight,
                                child: Text("TK ${widget.chekoutDataModel.allItem[index].totalPrice}",style: TextStyle(fontSize: 14,color: blackColor),))),
                        ],
                      ),
                    ),
                    );
                      
                    })),
                    )
                    
                     , const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Divider(thickness: 2,),
                    ),
                  
                    Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Expanded(flex: 9,
                          child: Text("Subtotal",style: TextStyle(fontSize: 16,color: blackColor),)),
                          Expanded(flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("TK ${totalAmount} ",style: TextStyle(fontSize: 14,color: blackColor),))),
                      ],
                    ),
                    ),
                    // Padding(
                    // padding: const EdgeInsets.only(top: 10),
                    // child: Row(
                    //   children: [
                    //     Expanded(flex: 9,
                    //       child: Text("Discount",style: TextStyle(fontSize: 16,color: blackColor),)),
                    //       Expanded(flex: 3,
                    //         child: Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Text(" TK 20 ",style: TextStyle(fontSize: 14,color: blackColor),))),
                    //   ],
                    // ),
                   // ),
                     const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Divider(thickness: 2,),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Expanded(flex: 9,
                          child: Text("Total",style: TextStyle(fontSize: 16,color: blackColor,fontWeight: FontWeight.bold),)),
                          Expanded(flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("TK ${totalAmount}",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.bold),))),
                      ],
                    ),
                    ),
                    
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
                    color: white,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                      child: Container(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: CancelButtonWidget(buttonHeight: 50, fontColor: mainColor, buttonName: "POSM" , fontSize: 14, onTapFuction: (){
                                    Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => POSMScreen())));
                                  }, borderColor: mainColor)
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: CancelButtonWidget(buttonHeight: 50, fontColor: mainColor, buttonName: " MR ", fontSize: 14, onTapFuction: (){
                                    Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => MarketReturnScreenNew(routingFrom: "MR", total: "", clientInfo: widget.clientInfo, outletIndex: widget.outletIndex))));
                                  }, borderColor: mainColor)
                                ),
                              )
                              //  Expanded(
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(top: 10,left: 20),
                              //     child: BottomNavigationBar(
                              //       type: BottomNavigationBarType.fixed,
                              //         elevation: 0.0,
                              //         backgroundColor: Colors.white,
                              //         selectedItemColor: mainColor,
                              //         unselectedItemColor: Colors.black,
                              //         selectedIconTheme:
                              //             const IconThemeData(size: 32),
                              //         currentIndex: currentIndex,
                              //         onTap: (value) {
                              //          print(value);
                              //           setState(() {
                              //             currentIndex = value;
                              //             // pageController.animateToPage(currentIndex,
                              //             //     duration:
                              //             //         const Duration(milliseconds: 100),
                              //             //     curve: Curves.linear);
                              //           });
                              //         },
                              //         items:  [
                              //          currentIndex==0? BottomNavigationBarItem(
                              //               icon: Image.asset("assets/icons/homePage_fill.png",color:mainColor, height: 30,),label: "" ):BottomNavigationBarItem(
                              //               icon: Image.asset("assets/icons/homepage.png",color:Colors.black, height: 30,),label: "" ),
                              //         currentIndex==1? BottomNavigationBarItem(
                              //               icon: Image.asset("assets/icons/category_fill.png",color:white, height: 0,),label: ""
                              //               ) :  BottomNavigationBarItem(
                              //               icon: Image.asset("assets/icons/category1.png",color:Colors.white, height: 0,),label: ""
                              //               ),
                                        
                              //         //  BottomNavigationBarItem(
                              //         //       icon: Image.asset("assets/icons/search1.png",color:currentIndex==2?mainColor: Colors.black, height: 30,),label: ""
                              //         //       ),
                              //         ]),
                              //   ),
                              // ),
                              , 
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 61, 80, 251),
                                    ),
                                    child: Row(
                                      
                                      children: [
                                      const  Expanded(
                                          flex: 6,
                                          child: Center(
                                            child:  Text(
                                              " Checkout",
                                              style: textSTYLEHeadline16,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                color: mainColor,
                                                child: Padding(
                                                  padding:const EdgeInsets.all(4.0),
                                                  child: Center(
                                                    child: FittedBox(
                                                      child: Text(
                                                        "  ৳${totalAmount}",
                                                        style: textSTYLEHeadline15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                              
                            ],
                          ),
                  ),
    );
  }
  void getTotalData(){
    totalAmount=0;
     for (var element in widget.chekoutDataModel.allItem) {
                           double total =
                                  double.parse(element.totalPrice??"0.0");
                              double discount = double.parse(element
                                      .discountInput == ""
                                  ? "0.0"
                                  : element
                                      .discountInput
                                      .toString());
                              totalAmount = totalAmount + total;
                              discountTotal = discountTotal + discount;
                              print(totalAmount);}

  }
}