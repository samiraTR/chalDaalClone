import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/questions.dart';
import 'package:tst_app2/utils/theme.dart';

class CutomerListScreen extends StatefulWidget {
  String fromScreenName;
   CutomerListScreen({super.key,required this.fromScreenName});

  @override
  State<CutomerListScreen> createState() => _CutomerListScreenState();
}

class _CutomerListScreenState extends State<CutomerListScreen> with SingleTickerProviderStateMixin {
  File? imagePath;
  late TabController controller;
  OutletReturnList? outletList;
  List<bool> tappedStates = [];
  List<Client> yetToVisitList=[];
  List<Client> orderedList=[];
 

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    getAllSyncInfoFiter();
    

  }


  //========================== sku filter =================
  getAllSyncInfoFiter(){
  outletList = Boxes.getOutletDataForSync().get('syncOutletsList');
  if(outletList!=null){
    yetToVisitList= outletList!.visitPlan.clients.where((element) => element.orderStatus=="Yet to Visit").toList();
    setState(() {
      
    });
     
    }   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: mainColor,
        title: Text("Outlets",style: TextStyle(color: white,fontSize: 20),),
        centerTitle: true,
   bottom: TabBar(
            controller: controller,
            onTap: (value) async {
              yetToVisitList= outletList!.visitPlan.clients.where((element) => element.orderStatus=="Yet to Visit").toList();
              setState(() {});
            },
            isScrollable: true,
            tabs:  [
              Tab(text: "Yet to Visit(${yetToVisitList.length})"),
              Tab(text: " Ordered(${yetToVisitList.length})"),
              Tab(text: " Not Ordered(${yetToVisitList.length})"),  
            ]),
        
      ),
      body: TabBarView(controller: controller, children: [
        Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white
                              
                    ),
                    onChanged: (value) {
                                        setState(() {
                                          yetToVisitList = AllServices()
                                              .searchCleint(
                                                  value,
                                                  outletList!.visitPlan.clients.where((element) => element.orderStatus=="Yet to Visit").toList());
                                        });
                                      },
                  ),
                ),
              ),
            ),
           Expanded(child:   Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
              child: Container(
                height: 45,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5)
              ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(child: Text("Apply",style: TextStyle(color: white),)),
               )
                      ),
            ),)
           
          ],
        ),
       yetToVisitList.isEmpty? const Text("No Data Found"):  Expanded(
          child: listBuilderWidget(context, yetToVisitList),
        ),
      ],
    ),
    Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white
                              
                    ),
                    onChanged: (value) {
                                        setState(() {
                                          yetToVisitList = AllServices()
                                              .searchCleint(
                                                  value,
                                                  outletList!.visitPlan.clients.where((element) => element.orderStatus=="Yet to Visit").toList());
                                        });
                                      },
                  ),
                ),
              ),
            ),
           Expanded(child:   Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
              child: Container(
                height: 45,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5)
              ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(child: Text("Apply",style: TextStyle(color: white),)),
               )
                      ),
            ),)
           
          ],
        ),
       yetToVisitList.isEmpty? const Text("No Data Found"):  Expanded(
          child: listBuilderWidget(context, yetToVisitList),
        ),
      ],
    ),
       Column(
      children: [
        Row(
          children: [
            searchWidget(yetToVisitList,"Yet to Visit"),
           Expanded(child:   Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
              child: Container(
                height: 45,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5)
              ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(child: Text("Apply",style: TextStyle(color: white),)),
               )
                      ),
            ),)
           
          ],
        ),
       yetToVisitList.isEmpty? const Text("No Data Found"):  Expanded(
          child: listBuilderWidget(context, yetToVisitList),
        ),
      ],
    ),
        
      ]),
      
      
      
       
      // bottomNavigationBar:Container(
      //               color: white,
      //               child: GestureDetector(
      //                 onTap: (() {
      //                       //  Navigator.push(
      //                       // context,
      //                       // (MaterialPageRoute(
      //                       //     builder: (context) =>CutomerListScreen()
      //                       //          )));
                        

      //                 }),
      //                 child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.end,
      //                         children: [
                                
                                    
      //                               Expanded(
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.all(7.0),
      //                                     child: Container(
      //                                       height: 55,
      //                                       decoration: BoxDecoration(
      //                                           borderRadius:
      //                                               BorderRadius.circular(10),
      //                                               color:const Color.fromARGB(255, 61, 80, 251),
                                                
      //                                           ),
      //                                       child: Row(
      //                                         mainAxisAlignment:
      //                                             MainAxisAlignment.spaceEvenly,
      //                                         children: [
      //                                           Expanded(
      //                                                flex: 1,
      //                                             child: Container(
      //                                                 width: 45.0,
      //                                                 height: 45.0,
      //                                                 decoration: BoxDecoration(
      //                                                   shape: BoxShape.circle,
      //                                                   border: Border.all(
      //                                                     color: Colors.white,
      //                                                     width: 2.0,
      //                                                   ),
      //                                                 ),
      //                                                 child:const Center(child:  Text("10",style: TextStyle(color: Colors.white),)),
      //                                               ),
      //                                           ),
                    
      //                                          const Expanded(
      //                                             flex: 4,
      //                                             child:  Center(
      //                                               child: Text(
      //                                                   "Take Picture",
      //                                                 style: textSTYLEHeadline16,
      //                                               ),
      //                                             ),
      //                                           ),
      //                                           Expanded(
      //                                                flex: 2,
      //                                             child: Card(
      //                                                 shape: RoundedRectangleBorder(
      //                                                     borderRadius:
      //                                                         BorderRadius.circular(
      //                                                             10)),
      //                                                 color: mainColor,
      //                                                 child: const Padding(
      //                                                   padding: EdgeInsets.all(10.0),
      //                                                   child: Center(
      //                                                     child: Text(
      //                                                       "    ৳400     ",
      //                                                       style: textSTYLEHeadline15,
      //                                                     ),
      //                                                   ),
      //                                                 )),
      //                                           )
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ),
                             
      //                         ],
      //                       ),
      //               ),
      //             ) ,
    );
  }

  Expanded searchWidget(List<Client> previousList,String checkString) {
    return Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white
                            
                  ),
                  onChanged: (value) {
                                      setState(() {
                                        previousList = AllServices()
                                            .searchCleint(
                                                value,
                                                outletList!.visitPlan.clients.where((element) => element.orderStatus==checkString).toList());
                                      });
                                    },
                ),
              ),
            ),
          );
  }


  listBuilderWidget(BuildContext context,List<Client> clientList){
    return ListView.builder(
        itemCount: clientList.length,
        itemBuilder: (BuildContext context, int outletIndex) {
          return 
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (_) =>  const QuestionsScreen()));
                  

                },
                child: Column(
                  children: [
                    ListTile(
                    leading:  SizedBox(
                  
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor),
                              
                              shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/icons/shop.png",color:Colors.black87, height: 20,),
                            ))
                        ),
                    title: Text(clientList[outletIndex].clientName,style: TextStyle(color: blackColor), ),
                        ),
                      const  Divider(height: 2,)
                  ],
                ),
              );
        },
      );
  }
}