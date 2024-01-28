import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class AllProductListScreen extends StatefulWidget {
  // final void Function()? onPress;
  // const AllProductListScreen({super.key,required this.onPress});

  @override
  State<AllProductListScreen> createState() => _AllProductListScreenState();
}

class _AllProductListScreenState extends State<AllProductListScreen> {
  RetStr? skuListData;
  TextEditingController searchController= TextEditingController();
  Map<String, TextEditingController> ctnControllerMap = {};
  Map<String, TextEditingController> pcsControllerMap = {};
  Map<String, TextEditingController> discountControllerMap = {};
  Map<String,TextEditingController> eachprice={};
 

    bool isItemTile=true;
    bool isClear=false;
     List<bool> tappedStates = [];
  List<ItemList>  allFlavourList=[];
  List<BrandList> tempBrand=[];
  bool isSearch=false;
    @override
  void initState() {
    super.initState();
    getAllSyncInfoFiter();
    List<BrandList> brandList=skuListData!.brandList;
    for(int i=0; i<brandList.length; i++){
      for(int j=0; j<brandList[i].itemList.length;j++){
        ctnControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController();
        pcsControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        discountControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        eachprice[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
      }
    }
   
    homeColorNav = mainColor;
    totalCartAmount=0.0;

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
    allFlavourList=skuListData!.brandList.isNotEmpty? getUniqueFlavorNames(skuListData!.brandList.first.brandName,0):[];
    }  
    tempBrand= skuListData!.brandList.toList();
    for(int i=0 ; i<tempBrand.length;i++){
      for(int j=0; j<tempBrand[i].itemList.length; j++){

      }
    }
  }
  //================================== unique flavour name =========================================
  List<ItemList> getUniqueFlavorNames(String brandName,int brandIndexNum) {
  List<ItemList> uniqueFlavorItems = skuListData!.brandList.isNotEmpty
      ? skuListData!.brandList[brandIndexNum].itemList.toSet().toList()
      : [];

  Set<String> uniqueCombinations = Set<String>();
  List<ItemList> result = [];
  for (var item in uniqueFlavorItems) {
    String combination = '${item.brandName.trim()}|${item.flavorName.trim()}';
    if (!uniqueCombinations.contains(combination)) {
      uniqueCombinations.add(combination);
      result.add(item);
    }
  }
  return result;
  }

  //======================================= total count ===================================
  totalvaluCount(List<BrandList>brandList , String itemId ){
    double totalAmount=0.0;
    for(int i=0; i<brandList.length; i++){
      double eachBrandPrice=0;
      for(int j=0; j<brandList[i].itemList.length;j++){
        double eachCount1=0;
        String? ctnPrice= ctnControllerMap[brandList[i].itemList[j].itemId]!.text;
        String? pcsPrice= pcsControllerMap[brandList[i].itemList[j].itemId]!.text;
        double? ctnPriceEach=double.tryParse(ctnPrice)??0.0;
        double? pcsEachPrice=double.tryParse(pcsPrice)??0.0;
        double perctnPrice=ctnPriceEach*double.parse(brandList[i].itemList[j].tradePrice)*int.parse(brandList[i].itemList[j].ctnPcsRatio);
        double perPcsPrice =pcsEachPrice*double.parse(brandList[i].itemList[j].tradePrice);
        print("perctnPrice=$perctnPrice");
        print("perPcsPrice=$perPcsPrice");
        eachCount1=perctnPrice+perPcsPrice;
        eachBrandPrice=eachBrandPrice+eachCount1;
       // eachCount +=(double.parse(ctnControllerMap[brandList[i].itemList[j].itemId]!.text ?? "0.0")*double.parse(brandList[i].itemList[j].invoicePrice));  
      }
      totalAmount+=eachBrandPrice;
      totalCartAmount=totalAmount;
      setState(() { 
      
        print("total count======$totalAmount");
      });
    }
  }


  eachTotalCount(List<BrandList>brandList , String itemId ){
    double eachBrandPrice=0;
    for(int i=0; i<brandList.length; i++){
      //double eachBrandPrice=0;
      for(int j=0; j<brandList[i].itemList.length;j++){
        double eachCount1=0;
        String? ctnPrice= ctnControllerMap[brandList[i].itemList[j].itemId]!.text;
        String? pcsPrice= pcsControllerMap[brandList[i].itemList[j].itemId]!.text;
         String? dicountEach= discountControllerMap[brandList[i].itemList[j].itemId]!.text;
        double? ctnPriceEach=double.tryParse(ctnPrice)??0.0;
        double? pcsEachPrice=double.tryParse(pcsPrice)??0.0;
        double? discountEachPrice=double.tryParse(dicountEach)??0.0;
        double perctnPrice=ctnPriceEach*double.parse(brandList[i].itemList[j].tradePrice)*int.parse(brandList[i].itemList[j].ctnPcsRatio);
        double perPcsPrice =pcsEachPrice*double.parse(brandList[i].itemList[j].tradePrice);
        eachCount1=perctnPrice+perPcsPrice;
        eachBrandPrice=(eachBrandPrice+eachCount1)-discountEachPrice;
        eachprice[brandList[i].itemList[j].itemId]!.text=eachBrandPrice.toString();
        print("itemId=${brandList[i].itemList[j].itemId}");
       // eachCount +=(double.parse(ctnControllerMap[brandList[i].itemList[j].itemId]!.text ?? "0.0")*double.parse(brandList[i].itemList[j].invoicePrice));  
      }
     
      setState(() { 
         
        print("eachBrandPrice======$eachBrandPrice");
      });
    }

  }
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: white,
   
        title: Text("All Product",style: TextStyle(color:white),),
        bottom:isSearch == false? null: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: white
                                
                      ),
                      onChanged: (value) {
                        if(value.isNotEmpty){
                          isClear=true;    
                        }   
                        setState(() {
                           tempBrand = AllServices() .searchItem(
                                                    value,
                                                    skuListData!.brandList.toList());
                                          });
                                        },
                    ),
                  ),
                ),
              ),
           isClear?Expanded(child:   GestureDetector(
            onTap: (() {
              searchController.clear();
              tempBrand = AllServices().searchItem(
                                                    "",
                                                    skuListData!.brandList.toList());
                                                    
              setState(() {
                
              });
              
            }),
             child: Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
                  child: Container(
                    height: 45,
                  decoration: BoxDecoration(
                    color: mainColorShadow,
                    borderRadius: BorderRadius.circular(5)
                  ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(child: Text("Clear",style: TextStyle(color: white,fontWeight: FontWeight.bold),)),
                   )
                          ),
                ),
           ),):  Expanded(child:   Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
                child: Container(
                  height: 45,
                decoration: BoxDecoration(
                  color: mainColorShadow,
                  borderRadius: BorderRadius.circular(5)
                ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(child: Text("Apply",style: TextStyle(color: white,fontWeight: FontWeight.bold),)),
                 )
                        ),
              ),)
             
            ],
          ),
        ),
        
        actions: [
          GestureDetector(
            onTap: (){
                isItemTile=!isItemTile;
                setState(() {

                 });              

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               decoration: BoxDecoration(
                 color: mainColor,
                 borderRadius: BorderRadius.circular(5)
               ),
                child:Image.asset(isItemTile?"assets/icons/grid.png":"assets/icons/listTile.png",color:white, height: 20,)),
            ),
          ),
          GestureDetector(
            onTap: (){
               
                setState(() {
                  isSearch =!isSearch;

                 });              

            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
               decoration: BoxDecoration(
                 color: mainColor,
                 borderRadius: BorderRadius.circular(5)
               ),
                child:Image.asset("assets/icons/search1.png",color:white, height: 20,)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
           
          children:List.generate(tempBrand.length, (index1) => Column(
            children: [
              Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                 tempBrand[index1].brandName,
                 style: const TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 18,
                   color: Colors.black,
                 ),
               ),
              ),
              ),
              SizedBox(
                height:300,
                child: ListView.builder(
                 physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                     itemCount: tempBrand[index1].itemList.length,
                     itemBuilder: (BuildContext context, int itemIndex) {
                     return ExpansionTile(
                     // backgroundColor: mainShadeColorNow,
                       leading:  SizedBox(
                         width: 70,
                         child: CachedNetworkImage(
                height: 100,
                    imageUrl:tempBrand[index1].itemList[itemIndex].itemAvatar,
                    errorWidget: (context, url, error) =>const Icon(Icons.error),
                  ),
                       ),
                     title: Text(tempBrand[index1].itemList[itemIndex].itemName),
                     subtitle: Text('Price: ${tempBrand[index1].itemList[itemIndex].tradePrice}'),
                     children: [
                       Padding(
                       padding:const  EdgeInsets.only(left: 20),
                       child: Row(
                         children: [
                const Expanded(child: Text("Promo Info ",style: TextStyle(fontWeight: FontWeight.bold),)),
                const Text(" :  "),
                 Expanded(flex: 3,
                  child:Text(tempBrand[index1].itemList[itemIndex].itemPromo,style:const TextStyle(),))
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
                      Expanded(
                        child: Padding(
                          padding:const  EdgeInsets.symmetric(horizontal: 8),
                          child: TextFormField(
                            textDirection: TextDirection.rtl,
                             decoration: InputDecoration(
                               filled: true,
                          fillColor: Colors.white,
                          hintText: "Ctn",
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                          width: 1, 
                          color: mainColor,
                                             ), 
                                                ),
                        ),
                             
                            controller:  ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: ((value) {
                              eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                              
                              totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                            
                              
                            }),
                        
                                            
                                            
                                              ),
                        )),
                    const  Text(" Ctn"),
                     const SizedBox(width: 20,),
                      Expanded(child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextFormField( 
                          textDirection: TextDirection.rtl,

                          decoration: InputDecoration(
                               filled: true,
                          fillColor: Colors.white,
                          hintText: "Pcs",
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                          width: 1, 
                          color: mainColor,
                                             ), 
                                                ),
                        ),
                          controller: pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                        
                         textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                          int pcs = int.tryParse(value) ?? 0;
                          int ctn = pcs ~/ int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                          int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                          if(givenCtnRatio<=pcs){
                            pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                           ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                      
                          }
                          eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                            totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                          },
                        ),
                      ),
                      ),
                      
                   // const  Text(" pcs"),
                    ],
                  ))
                         ],
                       ),
                       ),
                       Padding(
                       padding:const  EdgeInsets.only(left: 20),
                       child: Row(
                         children: [
                const Expanded(child: Text("Discount ",style: TextStyle(fontWeight: FontWeight.bold),)),
                const Text(" :  "),
                  Expanded(flex: 3,
                    child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextFormField( 
                          textDirection: TextDirection.rtl,

                          decoration: InputDecoration(
                               filled: true,
                          fillColor: Colors.white,
                          hintText: "",
                          
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                          width: 1, 
                          color: mainColor,
                                             ), 
                                                ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                          width: 1, 
                          color: mainColor,
                                             ), 
                                                ),
                        ),
                          controller: discountControllerMap[tempBrand[index1].itemList[itemIndex].itemId],
                        
                         textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                          // int pcs = int.tryParse(value) ?? 0;
                          // int ctn = (pcs / int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio)).ceil();
                          // int givenCtnRatio=int.parse(tempBrand[index1].itemList[itemIndex].ctnPcsRatio);
                          // if(givenCtnRatio<=pcs){
                          //   pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= (pcs-givenCtnRatio).toString();
                          //  ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text = (int.tryParse(ctnControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text) ?? 0+ctn).toString();
                      
                          // }
                          eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                          
                            totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                          },
                        ),
                      ),
                      ),
                         ],
                       ),
                       ),
                         Padding(
                       padding:const  EdgeInsets.only(left: 20,top:15, bottom: 20 ),
                       child: Row(
                         children: [
              const  Expanded(child: Text("Value ",style: TextStyle(fontWeight: FontWeight.bold),)),
               const Text(" :  "),
                 Expanded(flex: 3,
                  child: TextFormField( 
                          textDirection: TextDirection.rtl,
                          readOnly: true,

                          decoration:const InputDecoration(
                               filled: true,
                          fillColor: Colors.transparent,
                        //  hintText: "",
                          
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                          width: 1, 
                          color: Colors.transparent,
                                             ), 
                                                ),
                         
                        ),
                          controller: eachprice[tempBrand[index1].itemList[itemIndex].itemId],
                        
                         textAlign: TextAlign.end,
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                         
                         // eachTotalCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                          
                           // totalvaluCount(tempBrand,tempBrand[index1].itemList[itemIndex].itemId);
                          },
                        ),
                  )
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
                 ),
        ),
        )
                 
         
    //     child:Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: ListView.builder(
    //     itemCount: widget.itemList.length,
    //     itemBuilder: (BuildContext context, int itemIndex) {
    //       return ExpansionTile(
    //         leading:  SizedBox(
    //           width: 70,
    //               child: CachedNetworkImage(
    //                 height: 100,
    //                     imageUrl:widget.itemList[itemIndex].itemAvatar,
    //                     errorWidget: (context, url, error) =>const Icon(Icons.error),
    //                   ),
    //             ),
    //         title: Text(widget.itemList[itemIndex].itemName),
    //         subtitle: Text('Price: ${widget.itemList[itemIndex].invoicePrice}'),
    //         children: [
    //           Padding(
    //             padding:const  EdgeInsets.only(left: 20),
    //             child: Row(
    //               children: [
    //                const Expanded(child: Text("Promo Info ",style: TextStyle(fontWeight: FontWeight.bold),)),
    //                const Text(" :  "),
    //                  Expanded(flex: 3,
    //                   child:Text(widget.itemList[itemIndex].itemPromo,style:const TextStyle(),))
    //               ],
    //             ),
    //           ),
    //            Padding(
    //             padding:const  EdgeInsets.only(left: 20,top: 8),
    //             child: Row(
    //               children: [
    //               const  Expanded(child: Text("Orders  ",style: TextStyle(fontWeight: FontWeight.bold),)),
    //                const Text(" :  "),
    //                  Expanded(flex: 3,
    //                   child: Row(
    //                     children: [
    //                       Expanded(child: TextFormField(
    //                         decoration:const InputDecoration(
    //                             filled: true,
    //                             fillColor: Colors.white,
    //                             hintText: "ctn"
    //               ),
    //                                       textAlign: TextAlign.center,
    //                                       keyboardType: TextInputType.number,
                            

    //                       )),
    //                     const  Text(" ctn"),
    //                      const SizedBox(width: 20,),
    //                       Expanded(child: TextFormField(
    //                          decoration:const InputDecoration(
    //                             filled: true,
    //                             fillColor: Colors.white,
    //                             hintText: "pcs"
    //               ),
    //                                       textAlign: TextAlign.center,
    //                                       keyboardType: TextInputType.number,
    //                       )),
    //                     const  Text(" pcs"),
    //                     ],
    //                   ))
    //               ],
    //             ),
    //           ),
    //           const  Padding(
    //             padding:  EdgeInsets.only(left: 20,top:8 ),
    //             child: Row(
    //               children: [
    //                 Expanded(child: Text("Value ",style: TextStyle(fontWeight: FontWeight.bold),)),
    //                 Text(" :  "),
    //                  Expanded(flex: 3,
    //                   child: Text("120 ",style: TextStyle(),))
    //               ],
    //             ),
    //           ),
              
              
    //           const SizedBox(height: 10,)


             
    //         ],
    //       );
    //     },
    //   ),
    // )
    
    
    // : SingleChildScrollView(
    //                 scrollDirection: Axis.vertical,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: GridView.builder(
    //         shrinkWrap: true,
    //         itemCount: widget.itemList.length,
    //         gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2,
    //                         crossAxisSpacing: 12,
    //                         mainAxisSpacing: 12,
    //                         childAspectRatio: 0.8
    //         ),
    //         itemBuilder: (BuildContext context, int itemIndex) {
    //               return FlavourWiseEachItem(
    //                         dealsname:widget.itemList[itemIndex].itemName,
    //                         imageName: widget.itemList[itemIndex].itemAvatar,
    //                         price: widget.itemList[itemIndex].invoicePrice,
    //                                                  quantity   : widget.itemList[itemIndex].itemChain,
    //                         quantityName: widget.itemList[itemIndex].itemUnit,
    //                       );
              
             
    //         },
    //       )
                    
    //                 ),
        
      // ),
      // bottomNavigationBar:Container(
      //               color: white,
      //               child: GestureDetector(
      //                 onTap: (() {
      //                        Navigator.push(
      //                       context,
      //                       (MaterialPageRoute(
      //                           builder: (context) =>const CutomerListScreen()
      //                                )));
                        

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
      //                                                 "Add Customer",
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
}