// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tst_app2/bloc/theme_bloc.dart';
import 'package:tst_app2/ui/themes/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List theme = ["System", "Light", "Dark"];
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.purple, shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: const [
              Text("Gulshan"),
              Text(
                "Dhaka",
                style: TextStyle(fontSize: 13),
              ),
            ],
          )
        ],
      )),
      drawer: Drawer(
        width: 300,
        child: ListView(
          // padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
          children: [
            const CircleAvatar(
              maxRadius: 40,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Image.asset(
                  "assets/icons/football-club.png",
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                title: const Text(
                  "Egg Club",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            listTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "All Stores",
            ),
            listTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Offers",
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: DropdownButtonFormField(
                  isExpanded: true,
                  items: theme
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (String? value) {
                    if (value == "System") {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(const ThemeChanged(theme: AppTheme.system));
                    } else if (value == "Light") {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(const ThemeChanged(theme: AppTheme.light));
                    } else {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(const ThemeChanged(theme: AppTheme.dark));
                    }
                  }),
            ),
            const Divider(),
            listTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/deal.png",
              tileName: "Daily Deals",
            ),
            listTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Egg Club",
            ),
            listTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Egg Club",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  sideBarWidget(
                    barName: 'Grocery',
                    image: "assets/icons/groceries.png",
                  ),
                  sideBarWidget(
                    barName: 'Pharmacy',
                    image: "assets/icons/capsules.png",
                  ),
                  sideBarWidget(
                    barName: 'Cookups',
                    image: "assets/icons/stir-fry.png",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dealSHorizontalBarWidget(
                    dealsname: 'Daily Deals',
                    imageName: "assets/images/dim-offer.jpg",
                    color: Colors.blueGrey,
                  ),
                  dealSHorizontalBarWidget(
                    dealsname: 'Best Price',
                    imageName: "assets/images/chaal-offer.jpg",
                    color: const Color.fromARGB(255, 230, 209, 143),
                  ),
                  dealSHorizontalBarWidget(
                    dealsname: 'Protein',
                    imageName: "assets/images/Chaldal-Offer.jpg",
                    color: const Color.fromARGB(255, 230, 215, 84),
                  ),
                  dealSHorizontalBarWidget(
                    dealsname: 'Gogo Bangla',
                    imageName: "assets/images/cooking.jpg",
                    color: const Color.fromARGB(255, 9, 59, 100),
                  ),
                  dealSHorizontalBarWidget(
                    dealsname: 'Toiletries',
                    imageName: "assets/images/combo-offer-pack.jpg",
                    color: const Color.fromARGB(255, 9, 100, 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight / 6,
                width: screenWidth / 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 127, 185, 233),
                ),
                child: Center(child: Text("Daily Deals")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class dealSHorizontalBarWidget extends StatelessWidget {
  String imageName;
  String dealsname;
  Color color;
  dealSHorizontalBarWidget({
    Key? key,
    required this.imageName,
    required this.dealsname,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
      child: Container(
        height: 280,
        width: 160,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imageName,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                dealsname,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class sideBarWidget extends StatelessWidget {
  String image;
  String barName;
  sideBarWidget({
    Key? key,
    required this.image,
    required this.barName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
      child: Container(
        height: 70,
        width: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 232, 232),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 209, 204, 204),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green,
                child: Image.asset(
                  image,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              barName,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class listTileWidget extends StatelessWidget {
  String image;
  IconData icon;
  String tileName;
  listTileWidget({
    Key? key,
    this.image = " ",
    required this.icon,
    required this.tileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 30,
        width: 30,
      ),
      trailing: Icon(icon),
      title: Text(
        tileName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

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
