
import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/stock_model.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/repositories.dart';
import 'package:tst_app2/ui/area_list.dart';
import 'package:tst_app2/ui/widgets/sync_button_widget.dart';
import 'package:tst_app2/utils/theme.dart';

class Syncpage extends StatefulWidget {
  const Syncpage({super.key});

  @override
  State<Syncpage> createState() => _SyncpageState();
}

class _SyncpageState extends State<Syncpage> {
  RetStr? skuListData;
  OutletReturnList? outletReturnList;

//===================================== Get Sku and Save to Hive ===================================
  getSkuAndSave() async{
        await Repositories().getSKUList("","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-28");
        setState(() {  
        }); 
  }
//===================================== Get Outlets and Save to Hive ===================================
  getOuletsAndSave() async{
         await Repositories().getOuletsList("","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-29","v1.0-20240203-1","6269");
         setState(() {
           
         });       
  }
  //===================================== Get Stock and Save to Hive ===================================
  getStockAndSave() async{
         await Repositories().getStock("","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-29");
         setState(() {
           
         });       
  }
  //================================== all Synchronization ====================================
  allSynchronization()async{
    SkuListModel? skuList = await Repositories().getSKUList("All","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-28");
    OutletsListModel? outletsList = await Repositories().getOuletsList("All","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-29","v1.0-20240203-1","6269");
    StockModel? stockList = await Repositories().getStock("All","https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-29");
    if(skuList!=null && outletsList!=null && stockList!=null) {
      AllServices().dynamicToastMessage("All sync successfully done",
                        Colors.green, Colors.white, 14);                   
    } 
    else{
       AllServices().dynamicToastMessage("Did not sync all",
                        Colors.red, Colors.white, 14); 
    }

    setState(() {
         
       });
  }


  @override
  void initState() {
    super.initState();
    
  }



 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     // backgroundColor: mainColor,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Sync Screen ",
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
           outletReturnList = Boxes.getOutletDataForSync().get('syncOutletsList');
           if(skuListData!=null || outletReturnList!=null ){
            Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => AreaListScreen())));
            

           }
           else{
            AllServices().dynamicToastMessage("Plaese Sync all", Colors.red, Colors.white, 16);
           }

            
          }, icon: Icon(Icons.home,color: white,))

        ],
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
                      child: SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20, image: "assets/icons/product.png", imageHeight: 90, imagewidth: 70, buttonName: "SKU", textColor: mainColor, onpressedFuc: ()async{
                       await getSkuAndSave();
                      })
                    ),
                   const SizedBox(width: 
                    17,),
                    Expanded(
                      child:SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20,image: "assets/icons/shops13.png", imageHeight: 90, imagewidth: 70, buttonName: "Outlet", textColor: mainColor, onpressedFuc: ()async{
                       await getOuletsAndSave();
                      })
                    ),
    
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                   
                   
                    Expanded(
                      child:SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20,image: "assets/icons/stock1.png", imageHeight: 90, imagewidth: 60, buttonName: "Stock", textColor: mainColor, onpressedFuc: ()async{
                        await getStockAndSave();
                      })
                    ),
                    const SizedBox(width: 
                    17,),
                     Expanded(
                      child: SyncButtonWidget(buttonbackgroudColor: Color(0xffF3F6FF), buttonRadiousMea: 20, image: "assets/icons/all.png", imageHeight: 90, imagewidth: 70, buttonName: "Sync All", textColor: mainColor, onpressedFuc: ()async{
                      allSynchronization();
                      })
                    ),
    
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
           SizedBox(
               width: MediaQuery.of(context).size.width/1.2,
               height: 320, // Set the desired height
               child: Image.asset(
                      "assets/icons/sync3465667.jpg",
                      fit: BoxFit.cover, // Choose the BoxFit that suits your needs
               ),
           )
           
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