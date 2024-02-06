import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/stock_model.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/data_providers.dart';
import 'package:tst_app2/utils/constants.dart';

class Repositories {
  Future getImageRepo(pageNumber) async {
    // Map imageList = {};

    try {
      final http.Response response =
          await DataProviders().getImageDP(pageNumber);
      // List<UnsplashModel> imageList = unsplashModelFromJson(response.body);
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
      //  repositoryListModelData = skuListModelFromJson(json.encode(data));
      //     AllServices().modelWiseDataSaveToHive(Boxes.getSkuListDataForSync(),"syncSkuList", repositoryListModelData.retStr,"SKU Synchronization Successfully Done");
      if (response.statusCode == 200 && responseBody["status"]==200) {
        repositoryListModelData = skuListModelFromJson(response.body);
        if(messageChecker==""){
          AllServices().modelWiseDataSaveToHive(Boxes.getSkuListDataForSync(),"syncSkuList", repositoryListModelData.retStr,"SKU Synchronization Successfully Done");

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
    OutletsListModel? ouletsListModelData;
    try {
      final http.Response response = await DataProviders().getOutletsDP(outletsUrl, cid, userId, userPass, planDate, appVersion, syncCode);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        ouletsListModelData = outletsListModelFromJson(response.body);
        if(messageChecker==""){
            AllServices().modelWiseDataSaveToHive(Boxes.getOutletDataForSync(),"syncOutletsList", ouletsListModelData.outletReturnList,"Outlet Synchronization Successfully Done");

        } 
      
        return ouletsListModelData;
      } else {
         AllServices().dynamicToastMessage(responseBody["message"].toString(),
                        Colors.red, Colors.white, 14); 
        return ouletsListModelData;
      }
    } catch (e) {
      AllServices().dynamicToastMessage("$e", Colors.red, Colors.white, 14);
     
    }
    return ouletsListModelData;
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
        // if(messageChecker==""){
            AllServices().modelWiseDataSaveToHive(Boxes.getStockForSync(),"syncStock", stockModel.stockReturnList,"Stock Synchronization Successfully Done");

       // } 
      
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

}
