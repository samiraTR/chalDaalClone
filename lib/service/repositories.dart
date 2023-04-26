import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tst_app2/model/image_model.dart';

import 'package:tst_app2/service/apis.dart';
import 'package:tst_app2/service/data_providers.dart';

class Repositories {
  Future getImageRepo(pageNumber) async {
    // Map imageList = {};

    try {
      final http.Response response =
          await DataProviders().getImageDP(pageNumber);
      List<UnsplashModel> imageList = unsplashModelFromJson(response.body);
      print("imageList ${imageList.length}");

      return imageList;
    } catch (e) {
      print(e);
    }
  }
}
