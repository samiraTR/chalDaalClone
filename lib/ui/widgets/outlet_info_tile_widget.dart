import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/homepage.dart';
import 'package:tst_app2/utils/theme.dart';

class OutletInfoTileWidget extends StatelessWidget {
  CheckoutDataModel? checkoutDataModel;
  OutletReturnList? outletList;
  List<Client> clientList;
  BuildContext context;
 List <Client> clientDetails;


   OutletInfoTileWidget({super.key,required this.checkoutDataModel,required this.clientList,required this.context,required this.outletList,required this.clientDetails});

  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(
        itemCount: clientList.length,
        itemBuilder: (BuildContext context, int outletIndex) {
          return 
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (_) =>   AllProductListScreen(total: "", clientInfo:outletList!,outletIndex:outletIndex, routingFrom: 'Home', checkoutDataModel: checkoutDataModel,clientDetails: clientList[outletIndex],)));

                  
                  
                
                  // Navigator.push(context,
                  //  MaterialPageRoute(builder: (_) =>   HomeScreen(
                  //   total: "", clientInfo: outletList!,outletIndex:outletIndex, checkoutDataModel: checkoutDataModel, clientDetails: clientDetails[outletIndex],
                  //   )));
                  

                },
                child: Column(
                  children: [
                    ListTile(
                    leading:  SizedBox(
                  
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/icons/shops.png",height: 40,),
                          )
                        ),
                    title: Text(clientList[outletIndex].clientName,style: GoogleFonts.inter(color: mainColor,fontWeight: FontWeight.w500), ),
                    subtitle: Text(clientList[outletIndex].contactNo1,style: GoogleFonts.inter(color: Colors.black87,fontSize: 12), ),
                        ),
                 
                  ],
                ),
              );
        },
        
      );
  
  }
}