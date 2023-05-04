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
}
