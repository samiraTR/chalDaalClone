import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geo;

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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await geo.Geolocator.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
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

    address = "${placemarks[0].street!} ${placemarks[0].country!}";
  }
}
