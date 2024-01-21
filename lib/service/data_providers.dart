import 'package:http/http.dart' as http;
import 'package:tst_app2/service/apis.dart';

class DataProviders {
  Future getImageDP(int pageNumber) async {
    var param =
        "page=$pageNumber&per_page=30&client_id=xQPZiR8pze-Hs1VkZRm3Pu93CBM4r4235qkjXqOjbWc";

    http.Response response;
    response = await http.get(
      Uri.parse(Apis().imageApi(param)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    return response;
  }


//============================== Sku for Sync===================================
  Future<http.Response> getSKUDP (String SkUurl,String cid, String userId,String userPass,String planDate)async{
    print(Apis().skuSyncApi(SkUurl));
  final response = await http.post(
      Uri.parse(
          Apis().skuSyncApi(SkUurl), 
          ),
      //     headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',  
      // },
      body:{
          "cid" : cid,
          "user_id" : userId,
          "user_pass" : userPass,
          "visit_plan_date" : planDate
       }       
    );
    return response;
  }

  //============================== outlets for Sync===================================
Future<http.Response> getOutletsDP (String outletsUrl,String cid, String userId,String userPass,String planDate)async{
    print(Apis().skuSyncApi(outletsUrl));
  final response = await http.post(
      Uri.parse(
          Apis().outletSyncApi(outletsUrl), 
          ),
      //     headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',  
      // },
      body:{
          "cid" : cid,
          "user_id" : userId,
          "user_pass" : userPass,
          "visit_plan_date" : planDate
       }       
    );
    return response;
  }



    //============================== areaList===================================
Future<http.Response> getAreaList (String areListApi,String cid, String userId,String userPass)async{
    print(Apis().areaList());
  final response = await http.post(
      Uri.parse(
          Apis().areaList(), 
          ),
      body:{
          "cid" : cid,
          "user_id" : userId,
          "user_pass" : userPass,
         
       }       
    );
    return response;
  }





}
