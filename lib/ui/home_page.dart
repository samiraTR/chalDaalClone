
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tst_app2/bloc/theme_bloc.dart';
// import 'package:tst_app2/local_storage/boxes.dart';
// import 'package:tst_app2/model/oulets_model.dart';
// import 'package:tst_app2/model/sku_list_model.dart';
// import 'package:tst_app2/ui/oultet_list.dart';
// import 'package:tst_app2/ui/flavour_wise_itemList.dart';
// import 'package:tst_app2/ui/sync_page.dart';
// import 'package:tst_app2/ui/widgets/flavor_wise_card_widget.dart';
// import 'package:tst_app2/utils/constants.dart';
// import 'package:tst_app2/ui/all_categories.dart';
// import 'package:tst_app2/ui/product_details.dart';
// import 'package:tst_app2/themes/theme.dart';
// import 'package:tst_app2/ui/widgets/card_item_widgets.dart';
// import 'package:tst_app2/ui/widgets/deals_bar_widget.dart';
// import 'package:tst_app2/ui/widgets/list_tile_widget.dart';
// import 'package:tst_app2/ui/widgets/side_bar.dart';
// import 'package:tst_app2/utils/theme.dart';

// class HomePage extends StatefulWidget {
//    OutletReturnList clientInfo;
//   int outletIndex;
//     String total;
  
//    HomePage({super.key,required this.clientInfo,required this.outletIndex,required this.total});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List theme = ["System", "Light", "Dark"];
//  // PageController pageController = PageController();
//   double screenHeight = 0.0;
//   double screenWidth = 0.0;
//  // String? brandName;
//   //==================latest====================

//   RetStr? skuListData;
//   List<bool> tappedStates = [];
//   List<ItemList>  allFlavourList=[];
//   int brandNameIndexVar=0;
 

  

//   @override
//   void initState() {
//     super.initState();
//     getAllSyncInfoFiter();
//     homeColorNav = mainColor;

//   }


//   //========================== sku filter =================
//   getAllSyncInfoFiter(){
//   skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
//   if(skuListData!=null){
//      tappedStates = List.generate(
//       skuListData!.brandList.length,
//      (index) => false,
//       );
//     allFlavourList=[];
//     allFlavourList=skuListData!.brandList.isNotEmpty? getUniqueFlavorNames(skuListData!.brandList.first.brandName,0):[];
//     }   
//   }

// //================================== unique flavour name =========================================
//   List<ItemList> getUniqueFlavorNames(String brandName,int brandIndexNum) {
//   List<ItemList> uniqueFlavorItems = skuListData!.brandList.isNotEmpty
//       ? skuListData!.brandList[brandIndexNum].itemList.toSet().toList()
//       : [];

//   Set<String> uniqueCombinations = Set<String>();
//   List<ItemList> result = [];
//   for (var item in uniqueFlavorItems) {
//     String combination = '${item.brandName.trim()}|${item.flavorName.trim()}';
//     if (!uniqueCombinations.contains(combination)) {
//       uniqueCombinations.add(combination);
//       result.add(item);
//     }
//   }
//   return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
    
//     TextTheme textTheme = Theme.of(context).textTheme;
//     InputDecorationTheme inputDecoration =
//         Theme.of(context).inputDecorationTheme;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         title: Text("Home Page",style: TextStyle(color: white),),
        
//       //     title: InkWell(
//       //   onTap: () {

//       //     // showModalBottomSheet(
//       //     //     context: context,
//       //     //     builder: (context) {
//       //     //       return SizedBox(
//       //     //         height: 180,
//       //     //         child: ListView(
//       //     //           padding:const EdgeInsets.all(10),
//       //     //           children: [
//       //     //             ListTile(
//       //     //               contentPadding: const EdgeInsets.all(8),
//       //     //               onTap: () {
//       //     //                 setState(() {
//       //     //                   final res = AllServices().getLatLong();
//       //     //                   if (res == "") {
//       //     //                     bool loading = false;
//       //     //                     showDialog(
//       //     //                         context: context,
//       //     //                         builder: (builder) {
//       //     //                           Timer(const Duration(seconds: 3), () {
//       //     //                             loading = true;
//       //     //                             if (loading) {
//       //     //                               Navigator.pop(context);
//       //     //                               Navigator.pop(context);
//       //     //                             }
//       //     //                           });

//       //     //                           return  Column(
//       //     //                             crossAxisAlignment:
//       //     //                                 CrossAxisAlignment.center,
//       //     //                             children:  [
//       //     //                               Center(
//       //     //                                 child: Padding(
//       //     //                                   padding:const EdgeInsets.all(80),
//       //     //                                   child: CircularProgressIndicator(
//       //     //                                     color: mainColor,
//       //     //                                     backgroundColor: Colors.grey,
//       //     //                                   ),
//       //     //                                 ),
//       //     //                               ),
//       //     //                             ],
//       //     //                           );
//       //     //                         });
//       //     //                   }
//       //     //                 });
//       //     //               },
//       //     //               leading: SizedBox(
//       //     //                 height: 70,
//       //     //                 width: 70,
//       //     //                 child: Card(
//       //     //                   color: Colors.white,
//       //     //                   shape: RoundedRectangleBorder(
//       //     //                       borderRadius: BorderRadius.circular(100)),
//       //     //                   elevation: 3,
//       //     //                   child: const Icon(
//       //     //                     Icons.location_searching,
//       //     //                     color: Colors.black,
//       //     //                   ),
//       //     //                 ),
//       //     //               ),
//       //     //               title: const Text(
//       //     //                 "Use my current location",
//       //     //                 style: TextStyle(fontWeight: FontWeight.w500),
//       //     //               ),
//       //     //             ),
//       //     //             const Divider(
//       //     //               color: Colors.grey,
//       //     //               height: 3,
//       //     //             ),
//       //     //             ListTile(
//       //     //               contentPadding: const EdgeInsets.all(8),
//       //     //               leading: SizedBox(
//       //     //                 height: 70,
//       //     //                 width: 70,
//       //     //                 child: Card(
//       //     //                   color: Colors.white,
//       //     //                   shape: RoundedRectangleBorder(
//       //     //                       borderRadius: BorderRadius.circular(100)),
//       //     //                   elevation: 3,
//       //     //                   child: const Icon(
//       //     //                     Icons.location_city,
//       //     //                     color: Colors.black,
//       //     //                   ),
//       //     //                 ),
//       //     //               ),
//       //     //               onTap: () {
//       //     //                 Navigator.push(context,
//       //     //                     MaterialPageRoute(builder: (_) => const AllCities()));
//       //     //               },
//       //     //               title: const Text(
//       //     //                 "Change City",
//       //     //                 style: TextStyle(fontWeight: FontWeight.w500),
//       //     //               ),
//       //     //             ),
//       //     //           ],
//       //     //         ),
//       //     //       );
//       //     //     });
//       //   },
//       //   child: Row(
//       //     children: [
//       //       Container(
//       //         height: 40,
//       //         decoration:  BoxDecoration(
//       //             color: white, shape: BoxShape.circle),
//       //         child: IconButton(
//       //           icon:Image.asset("assets/icons/location.png",height: 30,color: mainColorShadow,),
//       //           onPressed: () {
//       //             showModalBottomSheet(
//       //                 context: context,
//       //                 builder: (context) {
//       //                   return const SizedBox(
//       //                     height: 180,
//       //                   );
//       //                 });
//       //           },
//       //         ),
//       //       ),
//       //     //   const SizedBox(
//       //     //     width: 2,
//       //     //   ),
//       //     //  const Column(
//       //     //   crossAxisAlignment: CrossAxisAlignment.start,
//       //     //     children:  [
//       //     //       Text("Gulshan",style: TextStyle(fontSize: 14,color: Colors.black),),
//       //     //       Text(
//       //     //         "Dhaka",
//       //     //         style: TextStyle(fontSize: 12,color: Colors.grey),
//       //     //       ),
//       //     //     ],
//       //     //   )
//       //     ],
//       //   ),
//       // ),
      
//       actions: [
//         GestureDetector(
//           onTap: () {
//              Navigator.push(context,
//                    MaterialPageRoute(builder: (_) =>  CutomerListScreen(
//                     fromScreenName: 'home',
//                    )));
            
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: white,
//                 borderRadius: BorderRadius.circular(5)
//               ),
//                child: Padding(
//                  padding:const  EdgeInsets.all(8.0),
//                  child: Center(child: Text("Select Outlets",style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),)),
//                )
//             ),
//           ),
//         )
//       ],
//       ),


//       //===============================================================Drawer==========================
//       drawer: Drawer(
//         width: 300,
//         child: ListView(
//           // padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
//           children: [
//             const CircleAvatar(
//               maxRadius: 40,
//             ),
//             TextButton(
//               onPressed: () {},
//               child:  Text("Tahmina Akter Bristy",style: TextStyle(color: mainColor),),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.dark_mode,
//                     color: Colors.black,
//                   ),
//                   Switch(
//                       value: newValue,
//                       activeColor: Colors.amber,
//                       onChanged: (bool value) {
//                         setState(() {
//                           newValue = value;

//                           if (newValue) {
//                             BlocProvider.of<ThemeBloc>(context)
//                                 .add(const ThemeChanged(theme: AppTheme.light));
//                           } else {
//                             BlocProvider.of<ThemeBloc>(context)
//                                 .add(const ThemeChanged(theme: AppTheme.dark));
//                           }
//                         });
//                       }),
//                   Icon(
//                     Icons.wb_sunny,
//                     color: Colors.amber[400],
//                   ),
//                 ],
//               ),
//             ),
//              const Divider(),
           
//            ListTileWidget(trailingIcon: Icons.keyboard_arrow_right_rounded, icon: Icons.history, tileName: "Sync", ontap: (){
//             Navigator.push(context,
//                    MaterialPageRoute(builder: (_) => const Syncpage()));

//            },)

        
//           ],
//         ),
//       ),
//       // ==============================================BODY=========================
//     //  body:  SizedBox(),

//       body: SafeArea(
//         child: 
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                  skuListData!=null?   SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: List.generate(
//                     skuListData==null ?0:  skuListData!.brandList.length,
//                       (brandnameIndex) => SideBarWidget(
//                         indexNum: brandnameIndex,
//                         barName: skuListData!.brandList[brandnameIndex].brandName,
//                         image: "assets/icons/capsules.png",
//                         tappedStates: tappedStates,
//                         onTap: (index, isTapped) {
//                           setState(() {
//                             tappedStates = List.from(isTapped);
//                             brandNameIndexVar=brandnameIndex;
//                              allFlavourList=[];
//                              allFlavourList=getUniqueFlavorNames(skuListData!.brandList[index].brandName, index);
                            
//                           });
                          

                           
//             },
//                ),
//             ),
//            ),
//             ):const SizedBox(),
//   // ============================================ promtion list  ==========================

//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         DealSHorizontalBarWidget(
//                           dealsname: 'Best Price',
//                           imageName: "assets/images/chaal-offer.jpg",
//                           color: const Color.fromARGB(255, 230, 209, 143),
//                         ),
//                         DealSHorizontalBarWidget(
//                           dealsname: 'Protein',
//                           imageName: "assets/images/Chaldal-Offer.jpg",
//                           color: const Color.fromARGB(255, 230, 215, 84),
//                         ),
//                          DealSHorizontalBarWidget(
//                           dealsname: 'Daily Deals',
//                           imageName: "assets/images/dim-offer.jpg",
//                           color: Colors.blueGrey,
//                         ),
//                         DealSHorizontalBarWidget(
//                           dealsname: 'Gogo Bangla',
//                           imageName: "assets/images/cooking.jpg",
//                           color: const Color.fromARGB(255, 9, 59, 100),
//                         ),
//                         DealSHorizontalBarWidget(
//                           dealsname: 'Toiletries',
//                           imageName: "assets/images/combo-offer-pack.jpg",
//                           color: const Color.fromARGB(255, 9, 100, 14),
//                         ),
//                       ],
//                     ),
//                   ),

                  

//  // ==============================================flavour List========================================

//                   SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           GridView.builder(
//                             shrinkWrap: true,
//                             itemCount: allFlavourList.length,
//                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 12,
//                                 mainAxisSpacing: 12,
//                                 childAspectRatio: 1.6),
//                             itemBuilder: (BuildContext context, int flavourIndex) {
                              
//                               return FlavorBarWidget(
//                                 brandName: skuListData!.brandList[brandNameIndexVar].brandName, 
//                                 flavorName: allFlavourList[flavourIndex].flavorName, 
//                                 flavorId: allFlavourList[flavourIndex].flavorId,
//                                 brandIndex: brandNameIndexVar,
//                                 flavourIndex:flavourIndex ,  
                                
//                               );
//                             },
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: TextButton(onPressed: (() {
//                               Navigator.push(
//                             context,
//                             (MaterialPageRoute(
//                                 builder: (context) =>
//                                     const AllCategoriesScreen())));
//                                               }), child: Text("All Categories",style: TextStyle(color: mainColor),)),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//  //============================================== Mixed product ===============================================                 
//                Column(
//                 children: List.generate(skuListData!.brandList.length, (index1) {
//                  return  Column(
//                   children: [
//                       Padding(
//                         padding:const  EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children:  [
//                             Text(
//                               skuListData!.brandList[index1].brandName,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 16,
//                                   color: Colors.black),
//                             ),
//                             GestureDetector
//                             (
//                               onTap: () {
//                                    Navigator.push(
//                             context,
//                             (MaterialPageRoute(
//                                 builder: (context) =>
//                                      FlavourWiseitemListScreen(itemList: getFlavourWoseItemList(skuListData!.brandList[index1].brandName, index1)))));
                              
//                               },
//                               child: Align(
//                                 alignment: Alignment.centerRight,
//                                 child: Text(
//                                   "View more",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15,
//                                       color: mainColor),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                     height: 250,
//                     width: double.infinity,       
//                     child: skuListData!.brandList.isNotEmpty? ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: skuListData!.brandList[index1].itemList.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ProductDetailsScreen(
//                                       productDetail: skuListData!.brandList[index1].itemList[index],
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: CardItemWidget(
//                                 itemList:skuListData!.brandList[index1].itemList[index] ,

//                             //     dealsname: skuListData!.brandList[index1].itemList[index].itemName,
//                             //     imageName: skuListData!.brandList[index1].itemList[index].itemAvatar,
//                             //     price: skuListData!.brandList[index1].itemList[index].invoicePrice,
//                             //  quantity   : skuListData!.brandList[index1].itemList[index].itemChain,
//                             //     quantityName: skuListData!.brandList[index1].itemList[index].itemUnit,
//                               ),
//                             ),
//                           );
//                         },
//                         ):const SizedBox(),
//                   ),
//                  const SizedBox(height: 30,)
//                  ],
//                 );
//                 }
//                 )
                 
//               ),
                  
//  //=========================================== any query =======================================            
//                   Container(
//                     height: 120,
//                     color: newValue
//                         ? const Color.fromARGB(255, 235, 229, 229)
//                         : const Color.fromARGB(255, 116, 113, 113),
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
//                             child: Text(
//                               "Need Help?",
//                               style: textTheme.headlineSmall,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children:  [
//                               Chip(
//                                 backgroundColor: Colors.white,
//                                 elevation: 3,
//                                 padding:const EdgeInsets.all(13),
//                                 avatar: Icon(
//                                   Icons.message,
//                                   size: 20,
//                                   color: mainColor
//                                 ),
//                                 label: Text(
//                                   "Live Chat",
//                                   style: TextStyle(color: mainColor),
//                                 ),
//                               ),
//                               Chip(
//                                 backgroundColor: Colors.white,
//                                 // padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
//                                 padding: const EdgeInsets.all(13),

//                                 elevation: 3,
//                                 avatar: Icon(
//                                   Icons.call,
//                                   size: 18,
//                                   color: mainColor,
//                                 ),
//                                 label: Text(
//                                   "Call",
//                                   style: TextStyle(color: mainColor),
//                                 ),
//                               ),
//                               Chip(
//                                 backgroundColor: Colors.white,
                 
//                                 padding:const EdgeInsets.all(13),

//                                 elevation: 3,
//                                 avatar: Icon(
//                                   Icons.question_mark_sharp,
//                                   size: 17,
//                                   color: mainColor,
//                                 ),
//                                 label: Text(
//                                   "FAQ",
//                                   style: TextStyle(color: mainColor),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
           
        
//       ),
     
//     );
//   }

//    //================================ Get Flavour Wise Item List=================================
//   List<ItemList> getFlavourWoseItemList(String brandName,int brandIndexNum) {
//   List<ItemList> brandwiseAllItemList = skuListData!.brandList.isNotEmpty
//       ? skuListData!.brandList[brandIndexNum].itemList.toList()
//       : [];
//   // List<ItemList> result = [];
  

//   // for( int i =0 ; i<brandwiseAllItemList.length; i++){
//   //   if(brandwiseAllItemList[i].flavorId.contains(flavorid)){
//   //     result.add(brandwiseAllItemList[i]);
//   //   }
//   // }
  
//  // _updateMessage();
//   return brandwiseAllItemList;
//   }
// }

