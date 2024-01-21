import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/utils/theme.dart';

class CutomerListScreen extends StatefulWidget {
  const CutomerListScreen({super.key});

  @override
  State<CutomerListScreen> createState() => _CutomerListScreenState();
}

class _CutomerListScreenState extends State<CutomerListScreen> {
  OutletReturnList? outletList;
  List<bool> tappedStates = [];
  
  @override
  void initState() {
    super.initState();
    getAllSyncInfoFiter();
    // homeColorNav = mainColor;

  }


  //========================== sku filter =================
  getAllSyncInfoFiter(){
  outletList = Boxes.getOutletDataForSync().get('syncOutletsList');
  // if(skuListData!=null){
  //    tappedStates = List.generate(
  //     skuListData!.brandList.length,
  //    (index) => false,
  //     );
  //   allFlavourList=[];
  //  // allFlavourList=skuListData!.brandList.isNotEmpty? getUniqueFlavorNames(skuListData!.brandList.first.brandName,0):[];
  //   }   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:const Text("Outlets "),
        actions: [
          GestureDetector(
            onTap: (){
                // isItemTile=!isItemTile;
                // setState(() { });              

            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset("assets/icons/homePage_fill.png",color:mainColor, height: 20,),
            ),
          )
        ],
      ),
      body:ListView.builder(
        itemCount: outletList!.visitPlan.clients.length,
        itemBuilder: (BuildContext context, int outletIndex) {
          return 
              Column(
                children: [
                  ListTile(
                  leading:  SizedBox(
                  //  width: 70,
                        child: Image.asset("assets/icons/shop.png",color:mainColor, height: 30,)
                      ),
                  title: Text(outletList!.visitPlan.clients[outletIndex].shortName,style:const  TextStyle(fontSize: 17,fontWeight: FontWeight.bold), ),
                  subtitle: Text('Depot ID: ${outletList!.visitPlan.clients[outletIndex].depotId}',style:const  TextStyle(color: Colors.black87),),
                  
                  
             
          ),
          Divider()
                ],
              );
        },
      ), 
      bottomNavigationBar:Container(
                    color: white,
                    child: GestureDetector(
                      onTap: (() {
                            //  Navigator.push(
                            // context,
                            // (MaterialPageRoute(
                            //     builder: (context) =>CutomerListScreen()
                            //          )));
                        

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
                                                        "Take Picture",
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