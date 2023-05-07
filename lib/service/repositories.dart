import 'package:http/http.dart' as http;
import 'package:tst_app2/model/image_model.dart';

import 'package:tst_app2/service/data_providers.dart';

class Repositories {
  Future<List<UnsplashModel>> getImageRepo(pageNumber) async {
    // Map imageList = {};

    List<UnsplashModel> imageList = [];
    try {
      final http.Response response =
          await DataProviders().getImageDP(pageNumber);
      imageList = unsplashModelFromJson(response.body);
      // List imageList = jsonDecode(response.body);

      print("imageList ${imageList.length}");

      return imageList;
    } catch (e) {
      print(e);
    }

    return imageList;
  }
}
