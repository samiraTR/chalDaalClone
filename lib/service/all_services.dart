import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/model/oulets_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';

class AllServices {
  double lat = 0.0;
  double long = 0.0;
  String address = "";
  // getLoc() {
//   String location = "";
//   Timer.periodic(const Duration(minutes: 3), (timer) {
//     getLatLong();
//     if (lat != 0.0 && long != 0.0) {
//       if (location == "") {
//         location = "$lat|$long";
//       } else {
//         location = "$location||$lat|$long";
//       }
//     }
//   });
// }

  Future<geo.Position> _determinePosition() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
  }

  getLatLong() {
    String address = "";
    Future<geo.Position> data = _determinePosition();
    data.then((value) {
      lat = value.latitude;
      long = value.longitude;

      // print(lat);

      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });

    return address;
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    address = placemarks[0].street! + " " + placemarks[0].country!;
  }



   void dynamicToastMessage(
      String msg, Color backgroundColor, Color textColor, fontSize) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16);
  }


  //============================ Model wise data put Method===========================
   modelWiseDataSaveToHive(Box databaseName, String tableName, dynamic modelName ,String toastMaessageText,){
     final syncSKUData=databaseName ;
     databaseName.clear();
     syncSKUData.put(tableName, modelName);
     AllServices().dynamicToastMessage(toastMaessageText,
                        Colors.green, Colors.white, 14); 
  }

  //================================= dynamic search ===========================================
  List<Client> searchCleint(String enterTheKey, List<Client> ffList) {
    List<Client> searchData = ffList;
    List<Client> results = [];
    if (enterTheKey.isEmpty || enterTheKey == '') {
      results = searchData;
    } else {
      var starts = searchData
          .where((element) =>
              element.shortName
                  .toLowerCase()
                  .startsWith(enterTheKey.toLowerCase()) ||
              element.depotId
                  .toLowerCase()
                  .startsWith(enterTheKey.toLowerCase()) ||
              element.depotName
                  .toLowerCase()
                  .startsWith(enterTheKey.toLowerCase()))
          .toList();
      var contains = searchData
          .where((element) =>
              (element.shortName
                      .toLowerCase()
                      .contains(enterTheKey.toLowerCase()) ||
                  element.depotId
                      .toLowerCase()
                      .contains(enterTheKey.toLowerCase()) ||
                  element.depotName
                      .toLowerCase()
                      .contains(enterTheKey.toLowerCase())) &&
              !(element.shortName
                      .toLowerCase()
                      .startsWith(enterTheKey.toLowerCase()) ||
                  element.depotId
                      .toLowerCase()
                      .startsWith(enterTheKey.toLowerCase()) ||
                  element.depotName
                      .toLowerCase()
                      .startsWith(enterTheKey.toLowerCase())))
          .toList();

      results = [...starts, ...contains];
    }
//print("result============================$result");
    return results;
  }


    //================================= dynamic search ===========================================
  List<BrandList> searchItem(String enterTheKey, List<BrandList> tempBrandffList) {
  List<BrandList> searchData = tempBrandffList;
  List<BrandList> results = [];

  if (enterTheKey.isEmpty || enterTheKey == '') {
    results = searchData;
  } else {
    var starts = searchData
        .where((brand) =>
            brand.itemList
                    .any((item) =>
                        item.itemName.toLowerCase().startsWith(enterTheKey.toLowerCase()) ||
                        item.itemSize.toLowerCase().startsWith(enterTheKey.toLowerCase()))
                ? true
                : false)
        .toList();

    var contains = searchData
        .where((brand) =>
            (brand.brandName.toLowerCase().contains(enterTheKey.toLowerCase())) ||
            brand.itemList
                .any((item) =>
                    item.itemName.toLowerCase().contains(enterTheKey.toLowerCase()) ||
                    item.itemSize.toLowerCase().contains(enterTheKey.toLowerCase())))
        .toList();

    results = [...starts, ...contains];
  }

  return results;
}
}
