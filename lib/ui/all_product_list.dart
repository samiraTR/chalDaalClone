import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/order_confirmation_screen.dart';
import 'package:tst_app2/ui/widgets/search_text_form_field_widget.dart';
import 'package:tst_app2/ui/widgets/show_dialog_item_Input.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_widget.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class AllProductListScreen extends StatefulWidget {
 
   CheckoutDataModel? checkoutDataModel;
  String routingFrom;
  OutletReturnList clientInfo;
  int outletIndex;
  String total;

  AllProductListScreen({super.key,required this.checkoutDataModel,
  required this.routingFrom,required this.total,required this.clientInfo,required this.outletIndex});

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
 
  String? selectedValue;
  bool isItemTile=true;
  bool isClear=true;
  List<bool> tappedStates = [];
  List<ItemList>  allFlavourList=[];
  List<BrandList> tempBrand=[];
  List<ItemList> filteredData=[];
  List<AllItem> savedItemList=[];
  bool isSearch=false;
    @override
  void initState() {
    super.initState();
    skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
    List<BrandList> brandList=skuListData!.brandList;
    selectedValue=skuListData!.brandList.first.brandName;
    filteredData=AllServices().getItemList(selectedValue!, skuListData!.brandList);
    //totalCartAmount=0;


    for(int i=0; i<brandList.length; i++){
      for(int j=0; j<brandList[i].itemList.length;j++){
        ctnControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController();
        pcsControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        discountControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        eachprice[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
      }
    }
   

  }

String  eachTotalCount(List<BrandList>brandList , String itemId ){
    double total= 0;
    double eachBrandPrice=0;
    for(int i=0; i<brandList.length; i++){
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
        total=eachBrandPrice;

        print("itemId=${brandList[i].itemList[j].itemId}");
       // eachCount +=(double.parse(ctnControllerMap[brandList[i].itemList[j].itemId]!.text ?? "0.0")*double.parse(brandList[i].itemList[j].invoicePrice));  
      }
     
      // setState(() { 
         
      //   print("eachBrandPrice======$eachBrandPrice");
      // });
     
    }
     return total.toString();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: white,
        iconTheme: IconThemeData(
          color: white
        ),
   
        title: Text("All Product",style: GoogleFonts.inter(color:white),),
        bottom:PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Row(
            children: [
              Expanded(
  flex: 4,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
    child: SizedBox(
      height: 45,
      child: SearchTextFormFieldWidget(borderColor: mainColor, controller: searchController, fillColor: white, hintText: 'Search for item by name', onChanged:(value) {
          if (value.isNotEmpty) {
            isClear = true;
          }
          setState(() {
            tempBrand = AllServices().searchItem(
              value,
              skuListData!.brandList.toList(),
            );
          });
        }, ),
      
    
    ),
  ),
),
         
             
            ],
          ),
        ),
  shape:const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  ),
        
        actions: [
         
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              width: 125, 
              height: 80,
               decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              
               child:DropdownButton<String>(
               value: selectedValue,
                selectedItemBuilder: (BuildContext context) {
              return skuListData!.brandList.map((BrandList brand) {
                 return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Center(child: Text(brand.brandName,style: GoogleFonts.inter(color: white),)),
                );
               }).toList();
              },
             
                hint: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text('Select Brand',style: GoogleFonts.inter(color: white)),
                ),
            
                  icon:const Icon(Icons.arrow_drop_down),
                  iconSize: 20, 
                  iconEnabledColor: Colors.white,
              
               items: skuListData!.brandList.map((BrandList brand) {
               return DropdownMenuItem<String>(
                 value: brand.brandName,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(brand.brandName,style: GoogleFonts.inter(color: blackColor),),
                ), 
                
               );
             }).toList(),
             onChanged: (String? value) {
              setState(() {
                selectedValue = value;

              });
              filteredData=AllServices().getItemList(value!, skuListData!.brandList);
     

           
             },
             
              underline: Container(), //
            
            )
           ),
         )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
         physics: const AlwaysScrollableScrollPhysics(),
        
            shrinkWrap: true,
             itemCount: filteredData.length,
             itemBuilder: (BuildContext context, int itemIndex) {
             return Row(
               children: [
                 Expanded(
                  flex: 5,
                   child: ListTile(
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
                              AllItem? allItem ;
                              int ctn=(int.tryParse(ctnControllerMap[filteredData[itemIndex].itemId]!.text.toString())??0);
                              int pcs= (int.tryParse(pcsControllerMap[filteredData[itemIndex].itemId]!.text.toString())??0);
                              Map<String,dynamic> callbackValue={};
                              if(ctn>0 || pcs>0){
                                  int? ctnWisePcs=  ctn* int.parse(filteredData[itemIndex].ctnPcsRatio.toString());
                                  double? total=(ctnWisePcs*double.parse(filteredData[itemIndex].tradePrice))+pcs;
                                  int? totalPcs=ctnWisePcs+pcs;
                                //   Map<String,dynamic> callbackValue={
                                //   "pcsCount":pcs.toString(),
                                //   "ctnCount":ctn.toString(),
                                //   "discount":discountControllerMap[filteredData[itemIndex].itemId]!.text,
                                //   "totalPcs":totalPcs.toString(),
                                //   "totalAmount":total.toString(),
                                //   "addItem":{}

                                //  };
                                 allItem=  AllItem(itemId: filteredData[itemIndex].itemId, 
                                  itemName: filteredData[itemIndex].itemName, 
                                  tradePrice: filteredData[itemIndex].tradePrice, 
                                  pcs: pcs.toString(), 
                                  ctn: ctn.toString(), totalPrice: total.toString(), discountInput: discountControllerMap[filteredData[itemIndex].itemId]!.text, totalPcs: totalPcs.toString(), ctnPcsRatio: filteredData[itemIndex].ctnPcsRatio, itemAvatar: filteredData[itemIndex].itemAvatar);
                                
                                if(savedItemList.isNotEmpty)  {
                                    savedItemList.removeWhere((element) => element.itemId==filteredData[itemIndex].itemId); 
                                  }
                                  savedItemList.add(allItem);

                              }
                             
                                  
         
                               return ShowDialogForItemInput(
                                itemInfo: allItem, 
                                savedData: savedItemList,
                                itemList:filteredData[itemIndex],
                                callbackValue:callbackValue, 
                                callbackFunction:(value){
                                pcsControllerMap[filteredData[itemIndex].itemId]!.text= value["pcsCount"].toString();
                                ctnControllerMap[filteredData[itemIndex].itemId]!.text= value["ctnCount"].toString();
                                discountControllerMap[filteredData[itemIndex].itemId]!.text= value["discount"].toString();
                               if(allItem!=null) {
                                savedItemList.add(allItem);
                                }
                                totalCartAmount=totalCartAmount+double.parse(value["totalAmount"]);
                                print(savedItemList);
                                 setState2;
                                  setState(() {
                                    
                                  });
                                  }, 
                                  
                                  
                               
                                
                                );
                     

                                
                             },
                           ),
                         );
                       },
                     );
                                      
                    },
                   
                     leading:  SizedBox(
                       child: CachedNetworkImage(
                        width: 45,
                                 height: 100,
                                     imageUrl:filteredData[itemIndex].itemAvatar,
                                     errorWidget: (context, url, error) =>const Icon(Icons.error),
                                   ),
                     ),
                   title: Text(filteredData[itemIndex].itemName,style:GoogleFonts.inter() ,),
                   subtitle: Text('Price: ৳${filteredData[itemIndex].tradePrice}',style: GoogleFonts.inter(color: const Color.fromARGB(255, 126, 125, 125)),),
                                       
                   
                     ),
                 ),
                 Expanded(
                    flex: 2,
                  
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StatefulBuilder(
                            builder: (context, setState2) {
                               AllItem? allItem ;
                              int ctn=(int.tryParse(ctnControllerMap[filteredData[itemIndex].itemId]!.text.toString())??0);
                              int pcs= (int.tryParse(pcsControllerMap[filteredData[itemIndex].itemId]!.text.toString())??0);
                              Map<String,dynamic> callbackValue={};
                              if(ctn>0 || pcs>0){
                                  int? ctnWisePcs=  ctn* int.parse(filteredData[itemIndex].ctnPcsRatio.toString());
                                  double? total=(ctnWisePcs*double.parse(filteredData[itemIndex].tradePrice))+pcs;
                                  int? totalPcs=ctnWisePcs+pcs;
                                //   Map<String,dynamic> callbackValue={
                                //   "pcsCount":pcs.toString(),
                                //   "ctnCount":ctn.toString(),
                                //   "discount":discountControllerMap[filteredData[itemIndex].itemId]!.text,
                                //   "totalPcs":totalPcs.toString(),
                                //   "totalAmount":total.toString(),
                                //   "addItem":{}

                                //  };
                                 allItem=  AllItem(itemId: filteredData[itemIndex].itemId, 
                                  itemName: filteredData[itemIndex].itemName, 
                                  tradePrice: filteredData[itemIndex].tradePrice, 
                                  pcs: pcs.toString(), 
                                  ctn: ctn.toString(), totalPrice: total.toString(), discountInput: discountControllerMap[filteredData[itemIndex].itemId]!.text, totalPcs: totalPcs.toString(), ctnPcsRatio: filteredData[itemIndex].ctnPcsRatio, itemAvatar: filteredData[itemIndex].itemAvatar);
                                
                                if(savedItemList.isNotEmpty)  {
                                    savedItemList.removeWhere((element) => element.itemId==filteredData[itemIndex].itemId); 
                                  }
                                  savedItemList.add(allItem);
                                
                              }
                              return Row(
                      children: [
                        Expanded(
                          child: TextFormFieldCustomWidget(
                            controller: ctnControllerMap[filteredData[itemIndex].itemId]!,
                             onChnaged: (value) { 
                              updateTotal(filteredData[itemIndex].itemId,filteredData[itemIndex]);
                             
                        
                              },
                        
                          ),
                        ),
                       const SizedBox(width: 6),
                        Expanded(
                          child: TextFormFieldCustomWidget(
                            controller: pcsControllerMap[filteredData[itemIndex].itemId]!,
                             onChnaged: (value) { 
                              updateTotal(filteredData[itemIndex].itemId,filteredData[itemIndex]);
                              
                        
                              },
                        
                          ),
                        ),
                      ],
                    );
                            },
                            
                       
                          ),
                    
                    // child: Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextFormFieldCustomWidget(
                    //         controller: ctnControllerMap[filteredData[itemIndex].itemId]!,
                    //          onChnaged: (value) { 
                    //           updateTotal(filteredData[itemIndex].itemId,filteredData[itemIndex]);
                             
                        
                    //           },
                        
                    //       ),
                    //     ),
                    //    const SizedBox(width: 6),
                    //     Expanded(
                    //       child: TextFormFieldCustomWidget(
                    //         controller: pcsControllerMap[filteredData[itemIndex].itemId]!,
                    //          onChnaged: (value) { 
                    //           updateTotal(filteredData[itemIndex].itemId,filteredData[itemIndex]);
                              
                        
                    //           },
                        
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ))
               ],
             );}
               ),
        ),
        bottomNavigationBar: Container(
                    color: white,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                                  
                                    Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: BottomNavigationBar(
                                    type: BottomNavigationBarType.fixed,
                                      elevation: 0.0,
                                      backgroundColor: Colors.white,
                                      selectedItemColor: mainColor,
                                      unselectedItemColor: Colors.black,
                                      selectedIconTheme:
                                          const IconThemeData(size: 32),
                                      currentIndex: currentIndex,
                                      onTap: (value) {
                                       print(value);
                                        setState(() {
                                          currentIndex = value;
                                         
                                        });
                                      },
                                      items:  [
                                       currentIndex==0? BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/homePage_fill.png",color:mainColor, height: 30,),label: "" ):BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/homepage.png",color:Colors.black, height: 30,),label: "" ),
                                      currentIndex==1? BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/category_fill.png",color:white, height: 0,),label: ""
                                            ) :  BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/category1.png",color:Colors.white, height: 0,),label: ""
                                            ),
                                        
                                      
                                      ]),
                                ),
                              ), 
                              Expanded(
                                flex: 5,
                                      child: GestureDetector(
                                        onTap: (() {
                                         
                                          Navigator.push(
                                                    context,
                                                       (MaterialPageRoute(
                                                            builder: (context) => OrderConfirmationScreen(chekoutDataModel: CheckoutDataModel(cid: widget.clientInfo.cid, userId: widget.clientInfo.userId ,userPass: "", deviceId: "", clientId: widget.clientInfo.visitPlan.clients[widget.outletIndex].clientId, clientName: widget.clientInfo.visitPlan.clients[widget.outletIndex].clientName, orderDate: widget.clientInfo.visitPlanDate, orderTime: widget.clientInfo.visitPlanDay, deliveryDate: widget.clientInfo.deliveryDate, deliveryTime: widget.clientInfo.deliveryDay, paymentMode: "cash", latitude: "", longitude: "", allItem: savedItemList, offer: "", rakList: "", note: ""), clientInfo: widget.clientInfo, outletIndex: widget.outletIndex,))));
                                          
                                        }),
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
                                                Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(
                                                      color: white,
                                                      width: 2
                                                    )
                                                  ),
                                                  child: Center(child: Text("0",style: GoogleFonts.inter(color: white),)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child:  Text(
                                                    "Checkout",
                                                    style: GoogleFonts.inter(fontSize: 18,color: white,fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                                
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    color: mainColor,
                                                    child:  Padding(
                                                      padding:const EdgeInsets.all(8.0),
                                                      child: FittedBox(
                                                        child: Text(
                                                          "    ৳${totalCartAmount.toStringAsFixed(1)}     ",
                                                          style: GoogleFonts.inter(fontSize: 18,color: white,fontWeight: FontWeight.w400),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  // : SizedBox.shrink(),
                           
                            ],
                          ),
                  ), 
    
    );
  
  }

  void updateTotal(String itemId,ItemList itemList) {





    



    for (var element in savedItemList) {
                          if(element.itemId!.contains(itemId)==true){
                            element.totalPcs=pcsControllerMap[itemId]!.text;
                           String eachTotal= AllServices().getCountEachValue(
                                       itemList,"0.0",pcsControllerMap[itemId]!.text,element.discountInput!,
                               );
                               totalCartAmount=totalCartAmount+double.parse(eachTotal);
                            }
                            else{
                              String eachTotal= AllServices().getCountEachValue(
                                       itemList,"0.0",pcsControllerMap[itemId]!.text,element.discountInput!,
                               );

                               totalCartAmount=totalCartAmount+double.parse(eachTotal);
                            }
                          }

                          setState(() {
                            
                          });
 
  }
}


