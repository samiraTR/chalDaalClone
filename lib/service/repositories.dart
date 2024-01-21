import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/data_providers.dart';

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
  Future<SkuListModel?> getSKUList(String skUurl,String cid, String userId,String userPass,String planDate) async {
    SkuListModel? repositoryListModelData;
    try {
      final http.Response response = await DataProviders().getSKUDP(skUurl, cid, userId, userPass, planDate);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        repositoryListModelData = skuListModelFromJson(response.body);
         AllServices().modelWiseDataSaveToHive(Boxes.getSkuListDataForSync(),"syncSkuList", repositoryListModelData.retStr,"SKU Synchronization Successfully Done");
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
  Future<OutletsListModel?> getOuletsList(String outletsUrl,String cid, String userId,String userPass,String planDate) async {
    OutletsListModel? ouletsListModelData;
    try {
      final http.Response response = await DataProviders().getOutletsDP(outletsUrl, cid, userId, userPass, planDate);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200 && responseBody["status"]==200) {
        ouletsListModelData = outletsListModelFromJson(response.body);
        AllServices().modelWiseDataSaveToHive(Boxes.getOutletDataForSync(),"syncOutletsList", ouletsListModelData.outletReturnList,"Outlet Synchronization Successfully Done");
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
   Future<Map<String,dynamic>> getAReWiseList(String outletsUrl,String cid, String userId,String userPass,String planDate) async {
    Map<String,dynamic> dateWiseOutlet={};
    try {
      final http.Response response = await DataProviders().getOutletsDP(outletsUrl, cid, userId, userPass, planDate);
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
  Future<Map<String, dynamic>> getAreaList(String areaListUrl,String cid, String userId,String userPass) async {
   Map<String, dynamic> responseBody={} ;
    try {
      final http.Response response = await DataProviders().getAreaList(areaListUrl, cid, userId, userPass);
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

}
