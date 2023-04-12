class AllServices {
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

// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//   return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
// }

// getLatLong() {
//   Future<Position> data = _determinePosition();
//   data.then((value) {
//     setState(() {
//       lat = value.latitude;
//       long = value.longitude;
//     });
//     getAddress(value.latitude, value.longitude);
//   }).catchError((error) {});
// }

// getAddress(lat, long) async {
//   List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//   setState(() {
//     address = "${placemarks[0].street!} ${placemarks[0].country!}";
//   });
//   for (int i = 0; i < placemarks.length; i++) {}
// }
}
