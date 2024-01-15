import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/repositories.dart';
import 'package:tst_app2/ui/widgets/sync_button_widget.dart';
import 'package:tst_app2/utils/theme.dart';

class Syncpage extends StatefulWidget {
  const Syncpage({super.key});

  @override
  State<Syncpage> createState() => _SyncpageState();
}

class _SyncpageState extends State<Syncpage> {

//===================================== Get Sku and Save to Hive ===================================
  getSkuAndSave() async{
        await Repositories().getSKUList("https://my.transcombd.com/smart_api","SMART", "IT29", "1234", "2023-12-14");
        //  if(skuList!=null && skuList.status==200) {  
        //               AllServices().modelWiseDataSaveToHive(Boxes.getSkuListDataForSync(),"syncSkuList", skuList.retStr,"SKU Synchronization Successfully Done");
        
        //   }
  }
//===================================== Get Outlets and Save to Hive ===================================
  getOuletsAndSave() async{
         await Repositories().getOuletsList("https://my.transcombd.com/smart_api","SMART", "IT29", "1234", "2023-12-14");
         
  }
  //================================== all Synchronization ====================================
  allSynchronization()async{
    SkuListModel? skuList = await Repositories().getSKUList("https://my.transcombd.com/smart_api","SMART", "IT29", "1234", "2023-12-14");
    OutletsListModel? outletsList = await Repositories().getOuletsList("https://my.transcombd.com/smart_api","SMART", "IT29", "1234", "2023-12-14");
    if(skuList!=null && skuList.status==200) {
      

    } 

   

  }



 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Sync Screen",style: TextStyle(color: mainColor),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            
            Row(
              children: [
                Expanded(
                  child: SyncButtonWidget(buttonbackgroudColor: white, buttonRadiousMea: 20, image: "assets/icons/item3.png", imageHeight: 90, imagewidth: 70, buttonName: "SKU", textColor: mainColor, onpressedFuc: ()async{
                   await getSkuAndSave();
                  })
                ),
               const SizedBox(width: 
                17,),
                Expanded(
                  child:SyncButtonWidget(buttonbackgroudColor: white, buttonRadiousMea: 20,image: "assets/icons/shops.png", imageHeight: 90, imagewidth: 70, buttonName: "Outlet", textColor: mainColor, onpressedFuc: ()async{
                   await getOuletsAndSave();
                  })
                ),
    
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal:80),
                    child: SyncButtonWidget(buttonbackgroudColor: white, buttonRadiousMea: 20,image: "assets/icons/stock.png", imageHeight: 90, imagewidth: 60, buttonName: "Stock", textColor: mainColor, onpressedFuc: ()async{
                     await getOuletsAndSave();
                    }),
                  )
                ), 
      
              ],
            ),
            const SizedBox(height: 12,),
      
            
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton.large(
    
        child: Column(children: [
          
          Image.asset("assets/icons/sync.png", ),
          const Text("All Sync")
          
        
        ]),
        onPressed: ()async{
        await getOuletsAndSave();
        }) ,
    );
  }
}