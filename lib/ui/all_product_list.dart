import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/ui/widgets/search_text_form_field_widget.dart';
import 'package:tst_app2/ui/widgets/show_dialog_item_Input.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_widget.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class AllProductListScreen extends StatefulWidget {
   //final ValueChanged<double> onCheckoutChanged;

  
  // final void Function()? onPress;
   AllProductListScreen({super.key, });

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
   
    // homeColorNav = mainColor;
    // totalCartAmount=0.0;

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
     
      setState(() { 
        double newCheckoutValue = totalAmount; // Change this to your actual logic
        //widget.onCheckoutChanged(newCheckoutValue);
      
        print("total count======$totalAmount");
      });
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


 void getItemList(String brandName){
  String brandId="";
    for(var item in skuListData!.brandList ){
                if(item.brandName==brandName){
                  brandId=item.brandId;
         }
    }
   tempBrand= skuListData!.brandList.where((element) => element.brandId==brandId).toList();

  }
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: white,
   
        title: Text("All Product",style: TextStyle(color:white),),
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
          //  isClear?Expanded(child:   GestureDetector(
          //   onTap: (() {
          //     searchController.clear();
          //     tempBrand = AllServices().searchItem(
          //                                           "",
          //                                           skuListData!.brandList.toList());
                                                    
          //     setState(() {
                
          //     });
              
          //   }),
          //    child: Padding(
          //         padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
          //         child: Container(
          //           height: 45,
          //         decoration: BoxDecoration(
          //           color: mainColorShadow,
          //           borderRadius: BorderRadius.circular(5)
          //         ),
          //          child: Padding(
          //            padding: const EdgeInsets.all(8.0),
          //            child: Center(child: Text("Select Brand",style: TextStyle(color: white,fontWeight: FontWeight.bold),)),
          //          )
          //                 ),
          //       ),
          //  ),):  Expanded(child:   Padding(
          //       padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
          //       child: Container(
          //         height: 45,
          //       decoration: BoxDecoration(
          //         color: mainColorShadow,
          //         borderRadius: BorderRadius.circular(5)
          //       ),
          //        child: Padding(
          //          padding: const EdgeInsets.all(8.0),
          //          child: Center(child: Text("Apply",style: TextStyle(color: white,fontWeight: FontWeight.bold),)),
          //        )
          //               ),
          //     ),)
             
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
          // GestureDetector(
          //   onTap: (){
          //       isItemTile=!isItemTile;
          //       setState(() {

          //        });              

          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //      decoration: BoxDecoration(
          //        color: mainColor,
          //        borderRadius: BorderRadius.circular(5)
          //      ),
          //       child:Image.asset(isItemTile?"assets/icons/grid.png":"assets/icons/listTile.png",color:white, height: 20,)),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: (){
               
          //       setState(() {
          //         isSearch =!isSearch;

          //        });              

          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Container(
          //      decoration: BoxDecoration(
          //        color: mainColor,
          //        borderRadius: BorderRadius.circular(5)
          //      ),
          //       child:Image.asset("assets/icons/search1.png",color:white, height: 20,)),
          //   ),
          // ),
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
                hint: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Select Brand',style: TextStyle(color: white)),
                ),
            
                  icon:const Icon(Icons.arrow_drop_down),
                  iconSize: 20, 
                  iconEnabledColor: Colors.white,
              
               items: skuListData!.brandList.map((BrandList brand) {
               return DropdownMenuItem<String>(
                 value: brand.brandName, 
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(brand.brandName,),
                ), 
                
               );
             }).toList(),
             onChanged: (String? value) {
              setState(() {
                selectedValue = value;

              });
              getItemList(value!);

           
             },
             style: TextStyle(color: blackColor),
              underline: Container(), //
            
            )
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
                 style:  TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 18,
                   color: blackColor,
                 ),
               ),
              ),
              ),
              SizedBox(
                height:tempBrand[index1].itemList.length*75,
                child: ListView.builder(
                 physics: const AlwaysScrollableScrollPhysics(),
                
                    shrinkWrap: true,
                     itemCount: tempBrand[index1].itemList.length,
                     itemBuilder: (BuildContext context, int itemIndex) {
                     return Row(
                       children: [
                         Expanded(
                          flex: 4,
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
                                      Map<String,dynamic> callbackValue={
                                        "pcsCount":"",
                                        "discount":"",
                                        "totalAmount":"",
                                      };
                                       return ShowDialogForItemInput(
                                        itemList:tempBrand[index1].itemList[itemIndex], callbackValue:callbackValue, 
                                        callbackFunction:(value){
                                          pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= value["pcsCount"].toString();
                                          discountControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!.text= value["discount"].toString();
                                         
                                          setState2;
                                          

                                        } ,
                                        );
                                     },
                                   ),
                                 );
                               },
                             );
                                              
                            },
                           
                             leading:  SizedBox(
                               child: CachedNetworkImage(
                                width: 60,
                                         height: 100,
                                             imageUrl:tempBrand[index1].itemList[itemIndex].itemAvatar,
                                             errorWidget: (context, url, error) =>const Icon(Icons.error),
                                           ),
                             ),
                           title: Text(tempBrand[index1].itemList[itemIndex].itemName),
                           subtitle: Text('Price: ৳${tempBrand[index1].itemList[itemIndex].tradePrice}',style: TextStyle(color: const Color.fromARGB(255, 126, 125, 125)),),
                                               
                           
                             ),
                         ),
                         Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: TextFormFieldCustomWidget(
                              controller: pcsControllerMap[tempBrand[index1].itemList[itemIndex].itemId]!,
                               onChnaged: (value) {  },

                            )
                          ))
                       ],
                     );}
                       ),
              ),
              
            ],
          ))
                 ),
        ),
        )
                 
         
    
    );
  }
}


