import 'package:hive_flutter/hive_flutter.dart';
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

    await Hive.openBox<RetStr>("syncSkuList");
    await Hive.openBox<OutletReturnList>("syncOutletsList");


    
    
  }


}