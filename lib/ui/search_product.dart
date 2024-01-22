import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/main.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class SearchproductScreen extends StatefulWidget {
  const SearchproductScreen({super.key});

  @override
  State<SearchproductScreen> createState() => _SearchproductScreenState();
}

class _SearchproductScreenState extends State<SearchproductScreen> {
  Box? box;
  List<BrandList> unsplashData = [];
  TextEditingController searchController = TextEditingController();



   RetStr? skuListData;
    bool isItemTile=true;
     List<bool> tappedStates = [];
  List<ItemList>  allFlavourList=[];
  List<BrandList> tempBrand=[];

  @override
  void initState() {
    super.initState();
    bottomNavRes = true;
   getAllSyncInfoFiter();
  }

   //========================== sku filter =================
  getAllSyncInfoFiter(){
  skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
  if(skuListData!=null){
     tappedStates = List.generate(
      skuListData!.brandList.length,
     (index) => false,
      );
    allFlavourList=[];
   // allFlavourList=skuListData!.brandList.isNotEmpty? getUniqueFlavorNames(skuListData!.brandList.first.brandName,0):[];
    }  
    tempBrand= [];
    unsplashData=[];
  }

  // hiveBox() async {
  //   skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
  //  // var a = box.get("imageData");
  //   // unsplashData = box.toMap().values.toList();
  //   for (var ele in skuListData!.brandList.toList()) {
  //     if (ele == null) {
  //       ele = "No Data";
  //     }
  //     unsplashData.add(ele);
  //     setState(() {});

  //     print(
  //         "if null aaaaaaaaaaas ${unsplashData.any((element) => element == null)}");
  //   }
  //   // unsplashData.where((element) {
  //   //   return element == null ? element = "No result" : element;
  //   // });
  //   print("unsplashData from ${unsplashData.length}");
  //   print("unsplashData from $unsplashData");
  // }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // void runFilter(String enteredKeyword) {
  //   box = Hive.box("imageList");
  //   List a = box?.get("imageData");

  //   List results = a;
  //   if (enteredKeyword.isEmpty) {
  //     unsplashData = results;
  //   } else {
  //     print("unsplashData.length1 ${unsplashData.length}");
  //     print("results.length1 ${results.length}");

  //     if (results.any((element) => element != null)) {
  //       var starts = results
  //           .where((s) => s["user"]["name"]
  //               .toLowerCase()
  //               .startsWith(enteredKeyword.toLowerCase()))
  //           .toList();

  //       var contains = results
  //           .where((s) =>
  //               s["user"]["name"]
  //                   .toLowerCase()
  //                   .contains(enteredKeyword.toLowerCase()) &&
  //               !s["user"]["name"]
  //                   .toLowerCase()
  //                   .startsWith(enteredKeyword.toLowerCase()))
  //           .toList()
  //         ..sort((a, b) => a["user"]["name"]
  //             .toLowerCase()
  //             .compareTo(b["user"]["name"].toLowerCase()));

  //       results = [...starts, ...contains];
  //     } else {
  //       unsplashData = results;
  //     }
  //   }

  //   // Refresh the UI
  //   setState(() {
  //     unsplashData = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
          bottomNavRes = false;
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
           backgroundColor: mainColor,
        foregroundColor: white,
        centerTitle: true,
   
       // title: Text("All Product",style: TextStyle(color:white),),
          title:  Text("Search Product",style: TextStyle(color:white,fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(child: Column(
             
            children:List.generate(unsplashData.length, (index1) => Column(
              children: [
                Padding(
                padding: const EdgeInsets.all(12),
                child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                   unsplashData[index1].brandName,
                   style: const TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 18,
                     color: Colors.black,
                   ),
                 ),
                ),
                ),
                SizedBox(
                 
                  height:600,
                  child: ListView.builder(
                   physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                       itemCount: unsplashData[index1].itemList.length,
                       itemBuilder: (BuildContext context, int itemIndex) {
                       return ExpansionTile(
                         leading:  SizedBox(
                           width: 70,
                           child: CachedNetworkImage(
                  height: 100,
                      imageUrl:unsplashData[index1].itemList[itemIndex].itemAvatar,
                      errorWidget: (context, url, error) =>const Icon(Icons.error),
                    ),
                         ),
                       title: Text(unsplashData[index1].itemList[itemIndex].itemName),
                       subtitle: Text('Price: ${unsplashData[index1].itemList[itemIndex].invoicePrice}'),
                       children: [
                         Padding(
                         padding:const  EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                  const Expanded(child: Text("Promo Info ",style: TextStyle(fontWeight: FontWeight.bold),)),
                  const Text(" :  "),
                   Expanded(flex: 3,
                    child:Text(unsplashData[index1].itemList[itemIndex].itemPromo,style:const TextStyle(),))
                           ],
                         ),
                         ),
                        Padding(
                         padding:const  EdgeInsets.only(left: 20,top: 8),
                         child: Row(
                           children: [
                           const  Expanded(child: Text("Orders  ",style: TextStyle(fontWeight: FontWeight.bold),)),
                  const Text(" :  "),
                   Expanded(flex: 3,
                    child: Row(
                      children: [
                        Expanded(child: TextFormField(
                      decoration:const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "ctn"
                           ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                      
                      
                        )),
                      const  Text(" ctn"),
                       const SizedBox(width: 20,),
                        Expanded(child: TextFormField(
                       decoration:const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "pcs"
                           ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                        )),
                      const  Text(" pcs"),
                      ],
                    ))
                           ],
                         ),
                         ),
                         const  Padding(
                         padding:  EdgeInsets.only(left: 20,top:8 ),
                         child: Row(
                           children: [
                  Expanded(child: Text("Value ",style: TextStyle(fontWeight: FontWeight.bold),)),
                  Text(" :  "),
                   Expanded(flex: 3,
                    child: Text("120 ",style: TextStyle(),))
                           ],
                         ),
                         ),
                         
                         
                         const SizedBox(height: 10,)
                      // SizedBox(
                      //               height: 250,
                      //               width: double.infinity,       
                      //               child: skuListData!.brandList.isNotEmpty? ListView.builder(
                      //                   scrollDirection: Axis.horizontal,
                      //                   shrinkWrap: true,
                      //                   itemCount: skuListData!.brandList[index1].itemList.length,
                      //                   itemBuilder: (context, index) {
                      //                     return Padding(
                      //                       padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      //                       child: InkWell(
                      //                         onTap: () {
                      //                           Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                               builder: (context) => ProductDetailsScreen(
                      //                                 productDetail: skuListData!.brandList[index1].itemList[index],
                      //                               ),
                      //                             ),
                      //                           );
                      //                         },
                      //                         child: CardItemWidget(
                      //                           dealsname: skuListData!.brandList[index1].itemList[index].itemName,
                      //                           imageName: skuListData!.brandList[index1].itemList[index].itemAvatar,
                      //                           price: skuListData!.brandList[index1].itemList[index].invoicePrice,
                      //                        quantity   : skuListData!.brandList[index1].itemList[index].itemChain,
                      //                           quantityName: skuListData!.brandList[index1].itemList[index].itemUnit,
                      //                         ),
                      //                       ),
                      //                     );
                      //                   },
                      //                   ):const SizedBox(),
                      //             ),
                          //const SizedBox(height: 30,)
                          ],
                         );}
                         ),
                ),
                
              ],
            ))
                   ),),
        ),
        bottomNavigationBar: bottomNavRes == true
            ? Container(
                width: 180,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            bottomNavRes = false;
                          });
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ),
                          );

                          // Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.keyboard_backspace_rounded)),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 235, 227, 227),
                          ),
                          controller: searchController,
                          onChanged: (value) {
                            
                                          setState(() {
                                            unsplashData = AllServices().searchItem(value, skuListData!.brandList.toList());
                                                
                                          });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
