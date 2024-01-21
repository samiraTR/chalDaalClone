import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/flavour_wise_itemList.dart';

class FlavorBarWidget extends StatefulWidget {
  String brandName;
  String flavorName;
  String flavorId;
  int brandIndex;
  int flavourIndex;

  // final VoidCallback updateMessage;


  FlavorBarWidget({
    Key? key,
     required this.brandName,
    required this.flavorName,
    required this.flavorId,
    required this.brandIndex,
    required this.flavourIndex,
    // required this.updateMessage,
  }) : super(key: key);

  @override
  State<FlavorBarWidget> createState() => _FlavorBarWidgetState();
}

class _FlavorBarWidgetState extends State<FlavorBarWidget> {
  RetStr? skuListData;
  List<ItemList> itemList=[];
  @override
  void initState() {
    super.initState();
    skuListData = Boxes.getSkuListDataForSync().get('syncSkuList');
    // print("  bar brandName= ${widget.brandName}");
    // print("  bar brandIndex= ${widget.brandIndex}");
    itemList=  skuListData!.brandList[widget.brandIndex].itemList.isEmpty?[]: getFlavourWoseItemList(widget.brandName, widget.brandIndex, widget.flavorName, widget.flavorId);
   
  }

  //================================ Get Flavour Wise Item List=================================
  List<ItemList> getFlavourWoseItemList(String brandName,int brandIndexNum, String flavourName,String flavorid) {
  List<ItemList> brandwiseAllItemList = skuListData!.brandList.isNotEmpty
      ? skuListData!.brandList[brandIndexNum].itemList.toList()
      : [];
  List<ItemList> result = [];
  

  for( int i =0 ; i<brandwiseAllItemList.length; i++){
    if(brandwiseAllItemList[i].flavorId.contains(flavorid)){
      result.add(brandwiseAllItemList[i]);
    }
  }
  
 // _updateMessage();
  return result;
  }

   void _updateMessage() {
    setState(() {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return GestureDetector(
      onTap: () {
        
         Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) =>
                                     FlavourWiseitemListScreen(itemList: getFlavourWoseItemList(widget.brandName, widget.brandIndex, widget.flavorName, widget.flavorId)))));

        
      },
      child: Container(
        height: 140,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getColorForIndex(),
            //color: const Color.fromARGB(255, 197, 217, 236),
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(1),
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  color: Colors.grey)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.flavorName,
                  style: textTheme.bodyLarge?.copyWith(color: cOLORBlack),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/ramadan2.png",
                  fit: BoxFit.cover,
                  height: 140,
                  width: 110,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Color getColorForIndex() {
    List<Color> colors =const [
       Color(0xffD6E5D8),
       Color(0xffF0E2D9),
       Color(0xffFFE8CC),
       Color(0xffF4EAF3),
        
       
    ];

    return colors[widget.flavourIndex % colors.length];
  }
}
