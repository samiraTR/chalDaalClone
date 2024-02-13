import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/widgets/home_button_widget.dart';
import 'package:tst_app2/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  CheckoutDataModel? checkoutDataModel;
  OutletReturnList clientInfo;
  int outletIndex;
    String total;
    Client clientDetails;
  
   HomeScreen({super.key,required this.clientInfo,required this.outletIndex,required this.total,required this.checkoutDataModel,required this.clientDetails});

  //const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     // backgroundColor: mainColor,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Order",style:GoogleFonts.inter(color: white,fontSize: 20,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 30),
            child: Column(
              children: [
                
                Row(
                  children: [
                    Expanded(
                      child: HomeButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20, image: "assets/icons/create_order.gif", imageHeight: 90, imagewidth: 70, buttonName: "Pre Order", textColor: mainColor, onpressedFuc: ()async{
                      // await getSkuAndSave();
                      Navigator.push(context,
                   MaterialPageRoute(builder: (_) =>   AllProductListScreen(
                    total: "", clientInfo:widget.clientInfo ,outletIndex:widget.outletIndex, routingFrom: 'Home', checkoutDataModel: widget.checkoutDataModel ,clientDetails: widget.clientDetails,)));
                      })
                    ),
                   const SizedBox(width: 
                    17,),
                    Expanded(
                      child:HomeButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20,image: "assets/icons/post_order.gif", imageHeight: 90, imagewidth: 70, buttonName: "Post Order", textColor: mainColor, onpressedFuc: ()async{
                       //await getOuletsAndSave();
                       Navigator.push(context,
                   MaterialPageRoute(builder: (_) =>   AllProductListScreen(total: "", clientInfo:widget.clientInfo ,outletIndex:widget.outletIndex, routingFrom: 'Home', checkoutDataModel: widget.checkoutDataModel,clientDetails: widget.clientDetails,)));
                      })
                    ),
    
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                   
                   
                    Expanded(
                      child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal:70),
                        child: HomeButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20,image: "assets/icons/purchase-order.gif", imageHeight: 90, imagewidth: 60, buttonName: "Order", textColor: mainColor, onpressedFuc: ()async{
                          Navigator.push(context,
                   MaterialPageRoute(builder: (_) =>   AllProductListScreen(total: "", clientInfo:widget.clientInfo ,outletIndex:widget.outletIndex, routingFrom: 'Home', checkoutDataModel: widget.checkoutDataModel,clientDetails: widget.clientDetails,)));
                  
                         // await getStockAndSave();
                        }),
                      )
                    ),
                    const SizedBox(width: 
                    17,),
                    //  Expanded(
                    //   child: SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20, image: "assets/icons/all.png", imageHeight: 90, imagewidth: 70, buttonName: "Sync All", textColor: mainColor, onpressedFuc: ()async{
                    //  // allSynchronization();
                    //   })
                    // ),
    
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child:Padding(
                //         padding: const EdgeInsets.symmetric(horizontal:70),
                //         child: SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20,image: "assets/icons/stock.png", imageHeight: 90, imagewidth: 60, buttonName: "Stock", textColor: mainColor, onpressedFuc: ()async{
                //          await getStockAndSave();
                //         }),
                //       )
                //     ), 
          
                //   ],
                // ),
                const SizedBox(height: 12),
               
          
                
              ],
            ),
            
          ),
        const Spacer(),
           Column(
             children: [
               SizedBox(
                   width: MediaQuery.of(context).size.width/1.1,
                   height: 250, // Set the desired height
                   child: Image.asset(
                          "assets/icons/order4567.jpg",
                          fit: BoxFit.cover, // Choose the BoxFit that suits your needs
                   ),
               ),
                SizedBox(height: 30,)
             ],
           ),
           
          // Image.asset("assets/icons/sync_catoon.png"),
            //     Container(
            //    //   height: 300,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color:white,
            //          borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(
            //     90,
            //   ),
            //   topLeft: Radius.circular(
            //     90,
            //   ),
            // ),
            //       ),
            //       child:   Image.asset("assets/icons/sync3465667.jpg",height: 400,),
            //     )
        ],
      ),
      // floatingActionButton:FloatingActionButton.extended(
      //   backgroundColor: mainColor,
    
      //   label:  Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text("Sync All",style: TextStyle(color: white),),
      //   ),
      //   onPressed: ()async{
      //   allSynchronization();
      //   }) ,
    );
  }
}