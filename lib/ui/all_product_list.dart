import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/themes/theme.dart';
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
  Client clientDetails;
  
  

  AllProductListScreen({super.key,required this.checkoutDataModel,
  required this.routingFrom,required this.total,required this.clientInfo,required this.outletIndex,required this.clientDetails});

  @override
  State<AllProductListScreen> createState() => _AllProductListScreenState();
}

class _AllProductListScreenState extends State<AllProductListScreen> {
  RetStr? skuListData;
  TextEditingController searchController= TextEditingController();
   final brandSelectedController = TextEditingController();
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
  
  int totalCount=0;
  bool isSearch=false;
    @override
    void initState() {
    super.initState();
    skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
    getAllItemfromBox();
    List<BrandList> brandList=skuListData!.brandList;
    selectedValue=skuListData!.brandList.first.brandName;
    filteredData=AllServices().getItemList(selectedValue!, skuListData!.brandList);
    for(int i=0; i<brandList.length; i++){
      for(int j=0; j<brandList[i].itemList.length;j++){
        ctnControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController();
        pcsControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        discountControllerMap[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
        eachprice[skuListData!.brandList[i].itemList[j].itemId] = TextEditingController(); 
      }
    }

  }
  getAllItemfromBox(){
    final orderSavedData = Boxes.outletWiseItemSaved();
    if(orderSavedData.isNotEmpty){
      orderSavedData.toMap().values.forEach((element) {
        if(element.clientId== widget.clientDetails.clientId)  {
          savedItemList=savedItemList;  
          setState(() {
            
          });
        }
      }); 
    }
   print("savedList=$savedItemList");

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
              child:   DropdownButtonHideUnderline(
  child: DropdownButton2(
    isExpanded: true,
    iconEnabledColor: Colors.white,
    hint: Text(
      'Select Brand',
      style: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
    items: skuListData!.brandList.map((BrandList brand) => DropdownMenuItem<String>(
      value: brand.brandName,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          brand.brandName,
          style: GoogleFonts.inter(
            color: Colors.black, 
            fontSize: 14,
          ),
        ),
      ),
    )).toList(),
    value: selectedValue,
    onChanged: (value) {
      selectedValue = value;
      filteredData = AllServices().getItemList(value!, skuListData!.brandList);
      setState(() {});
    },
    buttonHeight: 50,
    buttonWidth: MediaQuery.of(context).size.width / 1.5,
    itemHeight: 40,
    dropdownMaxHeight: 252,
    searchController: brandSelectedController,
    searchInnerWidgetHeight: 50,
    searchInnerWidget: Container(
      height: 50,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 4,
        right: 8,
        left: 8,
      ),
      child: TextFormField(
        expands: true,
        maxLines: null,
        controller: brandSelectedController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          hintText: 'Search Brand here...',
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    searchMatchFn: (item, searchValue) {
      return (item.value.toString().toUpperCase().startsWith(searchValue.toUpperCase()));
    },
    onMenuStateChange: (isOpen) {
      if (!isOpen) {
        brandSelectedController.clear();
      }
    },
    
    selectedItemBuilder: (BuildContext context) {
      return skuListData!.brandList.map<Widget>((BrandList brand) {
        return Center(
          child: Text(
            brand.brandName,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
        );
      }).toList();
    },
  ),
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
                  flex: 7,
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
                             
                              if(ctn>0 || pcs>0){
                                  int? ctnWisePcs=  ctn* int.parse(filteredData[itemIndex].ctnPcsRatio.toString());
                                  double? total=(ctnWisePcs*double.parse(filteredData[itemIndex].tradePrice))+pcs*double.parse(filteredData[itemIndex].tradePrice);
                                  int? totalPcs=ctnWisePcs+pcs;
                                  allItem=  AllItem(itemId: filteredData[itemIndex].itemId, 
                                  itemName: filteredData[itemIndex].itemName, 
                                  tradePrice: filteredData[itemIndex].tradePrice, 
                                  pcs: pcs.toString(), 
                                  ctn: ctn.toString(), totalPrice: total.toStringAsFixed(2), discountInput: discountControllerMap[filteredData[itemIndex].itemId]!.text, totalPcs: totalPcs.toString(), ctnPcsRatio: filteredData[itemIndex].ctnPcsRatio, itemAvatar: filteredData[itemIndex].itemAvatar);
                                
                                if(savedItemList.isNotEmpty)  {
                                    savedItemList.removeWhere((element) => element.itemId==filteredData[itemIndex].itemId); 
                                  }
                                  savedItemList.add(allItem);
                                  totalCounter();

                              } 
         
                               return ShowDialogForItemInput(
                                itemInfo: allItem, 
                                savedData: savedItemList,
                                itemList:filteredData[itemIndex],
                                callbackFunction:(value){
                                pcsControllerMap[filteredData[itemIndex].itemId]!.text= value!.pcs.toString();
                                ctnControllerMap[filteredData[itemIndex].itemId]!.text= value.ctn.toString();
                                discountControllerMap[filteredData[itemIndex].itemId]!.text= value.discountInput.toString();
                               if(allItem!=null) {
                                savedItemList.add(allItem);
                               }
                                totalCounter();
                                 setState2;
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
                   title: Text(filteredData[itemIndex].itemName,style:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400) ,),
                   subtitle: Text('Price: ৳${filteredData[itemIndex].tradePrice}',style: GoogleFonts.inter(color: const Color.fromARGB(255, 105, 105, 105),fontSize: 12),),
                                       
                   
                     ),
                 ),
                 Expanded(
  flex: 3,
  child: Padding(
    padding: const EdgeInsets.only(right: 10),
    child: StatefulBuilder(
      builder: (context, setState2) {
        if(ctnControllerMap[filteredData[itemIndex].itemId]!.text=="" && pcsControllerMap[filteredData[itemIndex].itemId]!.text==""){
          ctnControllerMap[filteredData[itemIndex].itemId]!.clear();
          pcsControllerMap[filteredData[itemIndex].itemId]!.clear();
          if(savedItemList.isNotEmpty)  {
            savedItemList.removeWhere((element) => element.itemId==filteredData[itemIndex].itemId);  
          }
        }
        else{
          AllServices().addItemToHiveModel(ctnControllerMap[filteredData[itemIndex].itemId]!.text.toString(), pcsControllerMap[filteredData[itemIndex].itemId]!.text.toString(),discountControllerMap[filteredData[itemIndex].itemId]!.text.toString(), savedItemList, filteredData[itemIndex]);

        }
       setState2(() {
       totalCounter();
          
        },);
        return Row(
          children: [
            Expanded(
              child: TextFormFieldCustomWidget(
                controller: ctnControllerMap[filteredData[itemIndex].itemId]!,
                onChnaged: (value) { 
                   AllServices().addItemToHiveModel(ctnControllerMap[filteredData[itemIndex].itemId]!.text.toString(), pcsControllerMap[filteredData[itemIndex].itemId]!.text.toString(),discountControllerMap[filteredData[itemIndex].itemId]!.text.toString(), savedItemList, filteredData[itemIndex]);
                    totalCounter();
                
                },
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: TextFormFieldCustomWidget(
                controller: pcsControllerMap[filteredData[itemIndex].itemId]!,
                onChnaged: (value) { 
                   AllServices().addItemToHiveModel(ctnControllerMap[filteredData[itemIndex].itemId]!.text.toString(), pcsControllerMap[filteredData[itemIndex].itemId]!.text.toString(),discountControllerMap[filteredData[itemIndex].itemId]!.text.toString(), savedItemList, filteredData[itemIndex]);
                    totalCounter();
                
                },
              ),
            ),
          ],
        );
      },
    ),
  ),
)
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

                                           
                                       setState(() {
                                         
                                       });
                                          Navigator.push(
                                                    context,
                                                       (MaterialPageRoute(
                                                            builder: (context) => OrderConfirmationScreen(chekoutDataModel: CheckoutDataModel(cid: widget.clientInfo.cid, userId: widget.clientInfo.userId ,userPass: "", deviceId: "", clientId: widget.clientInfo.visitPlan.clients[widget.outletIndex].clientId, clientName: widget.clientInfo.visitPlan.clients[widget.outletIndex].clientName, orderDate: widget.clientInfo.visitPlanDate, orderTime: widget.clientInfo.visitPlanDay, deliveryDate: widget.clientInfo.deliveryDate, deliveryTime: widget.clientInfo.deliveryDay, paymentMode: "cash", latitude: "", longitude: "", allItem: savedItemList, offer: "", rakList: "", note: ""), clientInfo: widget.clientInfo, outletIndex: widget.outletIndex, clientDetails: widget.clientDetails))));
                                          
                                        }),
                                        child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 61, 80, 251),
                                    ),
                                    child: Row(
                                      
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            children: [
                                              totalCount>0?   Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      border: Border.all(
                                                        color: white,
                                                        width: 2
                                                      )
                                                    ),
                                                    child: Center(child: Text(totalCount.toString(),style: GoogleFonts.inter(color: white),)),
                                                  ),
                                              ): SizedBox(
                                                    height: 35,
                                                    width: 35,
                                                   
                                                    child: Center(child: Text("",style: GoogleFonts.inter(color: white),)),
                                                  ),const SizedBox(width: 10,),
                                             const Center(
                                                child:  Text(
                                                  " Checkout",
                                                  style: textSTYLEHeadline16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                color: mainColor,
                                                child: Padding(
                                                  padding:const EdgeInsets.all(4.0),
                                                  child: Center(
                                                    child: FittedBox(
                                                      child: Text(
                                                        "  ৳ ${totalCartAmount.toStringAsFixed(1)}",
                                                        style: textSTYLEHeadline15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                      
                                      ),
                                    ),
                                  
                           
                            ],
                          ),
                  ), 
    
    );
  
  }

 
  totalCounter(){
     totalCartAmount=0;
     totalCount=savedItemList.length;
     for (var element in savedItemList) {
      int totalPcs= (int.parse(element.ctn!)*int.parse(element.ctnPcsRatio!))+ int.parse(element.pcs!);
      double eachPrice= double.parse(element.tradePrice!)*totalPcs;
      totalCartAmount= totalCartAmount+eachPrice;
      }
    
  }

  
}


