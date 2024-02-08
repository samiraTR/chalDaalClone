import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/model/Hive_model/stock_model.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';

class HiveAdapters{
  hiveAllAdapterBox() async{
    //==================== sku====================
    Hive.registerAdapter(RetStrAdapter());
    Hive.registerAdapter(BrandListAdapter());
    Hive.registerAdapter(ItemListAdapter());

    //=================== outlets================
    Hive.registerAdapter(OutletReturnListAdapter());
    Hive.registerAdapter(VisitPlanAdapter());
    Hive.registerAdapter(ClientAdapter());

    //=================== Stock =================
    Hive.registerAdapter(StockReturnListAdapter());
    Hive.registerAdapter(BrandListStockAdapter());
    Hive.registerAdapter(ItemListStockAdapter());

     //==================OutletWiseItemSaved========
    Hive.registerAdapter(CheckoutDataModelAdapter());
    Hive.registerAdapter(AllItemAdapter());

    await Hive.openBox<RetStr>("syncSkuList");
    await Hive.openBox<OutletReturnList>("syncOutletsList");
    await Hive.openBox<StockReturnList>("syncStock");
    await Hive.openBox<CheckoutDataModel>("OutletWiseItemSaved");


    
    
  }


}