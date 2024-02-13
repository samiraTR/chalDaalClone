import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/stock_model.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/data_providers.dart';
import 'package:tst_app2/utils/theme.dart';

class Repositories {
  Future getImageRepo(pageNumber) async {
  
    try {
      final http.Response response =
          await DataProviders().getImageDP(pageNumber);
      List imageList = jsonDecode(response.body);

      print("imageList ${imageList.length}");

      return imageList;
    } catch (e) {
      print(e);
    }
  }


  //====================================== Get SKU from Sync =============================
  Future<SkuListModel?> getSKUList(String messageChecker,String skUurl,String cid, String userId,String userPass,String planDate) async {
    SkuListModel? repositoryListModelData;
    try {
      final http.Response response = await DataProviders().getSKUDP(skUurl, cid, userId, userPass, planDate);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        repositoryListModelData = skuListModelFromJson(response.body);
         putSKUData(repositoryListModelData.retStr);
        if(messageChecker==""){ 
          AllServices().dynamicToastMessage("Sku List Succesfully Sync done",Colors.green, white, 16);
        } 
         return repositoryListModelData;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 
        return repositoryListModelData;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return repositoryListModelData;
  }



   //====================================== Get Outlets from Sync =============================
  Future<OutletsListModel?> getOuletsList(String messageChecker,String outletsUrl,String cid, String userId,String userPass,String planDate,String appVersion,String syncCode) async {
    OutletsListModel? outletsListModelData;
    try {
      final http.Response response = await DataProviders().getOutletsDP(outletsUrl, cid, userId, userPass, planDate, appVersion, syncCode);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        outletsListModelData = outletsListModelFromJson(response.body);
        putOutletData(outletsListModelData.outletReturnList);

        if(messageChecker==""){
          AllServices().dynamicToastMessage("Outlet sync succesfully done", Colors.green, white, 16);
          
        } 
        return outletsListModelData;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 
        return outletsListModelData;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return outletsListModelData;
  }


//================================= areList Selection=====================
   Future<Map<String,dynamic>> getAReWiseList(String outletsUrl,String cid, String userId,String userPass,String planDate,String syncCode, String appVersion) async {
    Map<String,dynamic> dateWiseOutlet={};
    try {
      final http.Response response = await DataProviders().getOutletsDP(outletsUrl, cid, userId, userPass, planDate,appVersion,syncCode);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        dateWiseOutlet=responseBody;
        return responseBody;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 

        return dateWiseOutlet;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return dateWiseOutlet;
  }




  //====================================== AreaList  =============================
  Future<Map<String, dynamic>> getAreaList(String areListApi,String cid, String userId,String userPass,String syncCode,String appVersion) async {
   Map<String, dynamic> responseBody={} ;
    try {
      final http.Response response = await DataProviders().getAreaList(areListApi, cid, userId, userPass, syncCode, appVersion);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        return responseBody;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 
        return responseBody;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return responseBody;
  }
   



     //====================================== Get Stock Model from Sync =============================
  Future<StockModel?> getStock(String messageChecker,String outletsUrl,String cid, String userId,String userPass,String planDate) async {
    StockModel? stockModel;
    try {
      final http.Response response = await DataProviders().getStockSync(outletsUrl, cid, userId, userPass, planDate);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        stockModel = stockModelFromJson(response.body);
        putOputStockData(stockModel.stockReturnList);
        if(messageChecker==""){
            AllServices().modelWiseDataSaveToHive(Boxes.getStockForSync(),"syncStock", stockModel.stockReturnList,"Stock Synchronization Successfully Done");
       } 
      
        return stockModel;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 
        return stockModel;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return stockModel;
  }

 //============================== save method ========================
  Future putSKUData(RetStr skuListModeldata) async {
    final skuListBox = Boxes.getSkuListDataForSync();
    skuListBox.put("syncSkuList", skuListModeldata);
  }
  Future putOutletData(OutletReturnList outletReturnList) async {
    final outletListBox = Boxes.getOutletDataForSync();
    outletListBox.put("syncOutletsList", outletReturnList);
  }
  Future putOputStockData(StockReturnList stockListData) async {
    final stockListtBox = Boxes.getStockForSync();
    stockListtBox.put("syncStock", stockListData);
  }

  

}
