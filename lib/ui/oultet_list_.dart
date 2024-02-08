import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/homepage.dart';
import 'package:tst_app2/ui/widgets/outlet_info_tile_widget.dart';
import 'package:tst_app2/ui/widgets/search_text_form_field_widget.dart';
import 'package:tst_app2/utils/theme.dart';

class CutomerListScreen extends StatefulWidget {
  String fromScreenName;
   CutomerListScreen({super.key,required this.fromScreenName});

  @override
  State<CutomerListScreen> createState() => _CutomerListScreenState();
}

class _CutomerListScreenState extends State<CutomerListScreen> with SingleTickerProviderStateMixin {
  TextEditingController searchController= TextEditingController();
  File? imagePath;
  late TabController controller;
  OutletReturnList? outletList;
  List<bool> tappedStates = [];
  List<Client> yetToVisitList=[];
  List<Client> orderedList=[];
  List<Client> notOrderList=[];

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
    orderedList= outletList!.visitPlan.clients.where((element) => element.orderStatus=="ORDER").toList();
    notOrderList= outletList!.visitPlan.clients.where((element) => element.orderStatus=="NOT ORDER").toList();
    setState(() { 
    });
     
    }   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
       appBar: AppBar(
         backgroundColor: mainColor,
        title: Text("Oultets",style:GoogleFonts.inter(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
       bottomLeft: Radius.circular(20),
       bottomRight: Radius.circular(20),
       ),
      ),
   bottom: PreferredSize(
     preferredSize: const Size.fromHeight(110.0), 
     child: Column(
       children: [ 
         TabBar(
                labelStyle: GoogleFonts.inter(),
                  controller: controller,
                  onTap: (value) async {
                    yetToVisitList= outletList!.visitPlan.clients.where((element) => element.orderStatus=="Yet to Visit").toList();
                    setState(() {});
                  },
                  isScrollable: true,
                  tabs:  [
                    Tab(text: "Yet to Visit(${yetToVisitList.length})"),
                    Tab(text: " Ordered(${orderedList.length})"),
                    Tab(text: " Not Ordered(${notOrderList.length})"),  
                  ]),
                  Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(     
              height: 45,
               child: SearchTextFormFieldWidget(borderColor: mainColor, controller: searchController, fillColor: white, hintText: 'Search for outlet by name', onChanged:(value) {
            
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
        
           
          ],
        ),
       const SizedBox(height: 8,)
       ],
     ),
   ),  ),
      body: TabBarView(controller: controller, children: [
        Column(
      children: [
       yetToVisitList.isEmpty? Expanded(child: Center(child: SizedBox(
        height: 200,width: 300,
        child: Image.asset("assets/icons/no_data1.jpg",fit: BoxFit.cover,)))):  Expanded(
          child: OutletInfoTileWidget(clientList: yetToVisitList, context: context, outletList: outletList, checkoutDataModel: null,)
        ),
      ],
    ),
    Column(
      children: [
       
       orderedList.isEmpty? Expanded(child: Center(child: SizedBox(
        height: 200,width: 300,
        child: Image.asset("assets/icons/no_data1.jpg",fit: BoxFit.cover,)))):  Expanded(
           child: OutletInfoTileWidget(clientList: orderedList, context: context, outletList: outletList, checkoutDataModel: null,)
         
        ),
      ],
    ),
       Column(
      children: [
       notOrderList.isEmpty? Expanded(child: Center(child: SizedBox(
        height: 200,width: 300,
        child: Image.asset("assets/icons/no_data1.jpg",fit: BoxFit.cover,)))):  Expanded(
          child: OutletInfoTileWidget(clientList: notOrderList, context: context, outletList: outletList, checkoutDataModel: null,)
        
        ),
      ],
    ),
        
      ]), 
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


  // listBuilderWidget(BuildContext context,List<Client> clientList){
  //   return ListView.builder(
  //       itemCount: clientList.length,
  //       itemBuilder: (BuildContext context, int outletIndex) {
  //         return 
  //             GestureDetector(
  //               onTap: (){
  //                 // Navigator.push(context,
  //                 //  MaterialPageRoute(builder: (_) =>  const QuestionsScreen()));
  //                 Navigator.push(context,
  //                  MaterialPageRoute(builder: (_) =>   HomeScreen(
  //                   total: "", clientInfo: outletList!,outletIndex:outletIndex
  //                   )));
                  

  //               },
  //               child: Column(
  //                 children: [
  //                   ListTile(
  //                   leading:  SizedBox(
                  
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Image.asset("assets/icons/shops.png",height: 40,),
  //                         )
  //                       ),
  //                   title: Text(clientList[outletIndex].clientName,style: GoogleFonts.inter(color: mainColor,fontWeight: FontWeight.w500), ),
  //                   subtitle: Text(clientList[outletIndex].contactNo1,style: GoogleFonts.inter(color: Colors.black87,fontSize: 12), ),
  //                       ),
  //                     //const  Divider(thickness: 1,color: Colors.black12,)
  //                 ],
  //               ),
  //             );
  //       },
        
  //     );
  // }
}