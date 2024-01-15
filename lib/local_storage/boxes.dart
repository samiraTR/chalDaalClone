import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';

class Boxes{
  static Box<RetStr> getSkuListDataForSync()=> Hive.box("syncSkuList");
  static Box<OutletReturnList>getOutletDataForSync()=> Hive.box("syncOutletsList");



  //   Future openBoxAndSave(String tableName, List syncData) async {
  //   var dir = await getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   Box box = await Hive.openBox(tableName);
  //   await box.clear();
  //   for (var d in syncData) {
  //     box.add(d);
  //   }
  // }
}