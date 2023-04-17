import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tst_app2/bloc/theme_bloc.dart';
import 'package:tst_app2/ui/all_categories.dart';
import 'package:tst_app2/ui/themes/theme.dart';
import 'package:tst_app2/ui/widgets/card_item_widgets.dart';
import 'package:tst_app2/ui/widgets/deals_bar_widget.dart';
import 'package:tst_app2/ui/widgets/list_tile_widget.dart';
import 'package:tst_app2/ui/widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List theme = ["System", "Light", "Dark"];
  bool newValue = true;
  List categories = [
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  ];
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ThemeBloc>(context)
        .add(const ThemeChanged(theme: AppTheme.light));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = ThemeData().textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

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
      //===============================================================Drawer==========================
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                children: [
                  const Icon(
                    Icons.dark_mode,
                    color: Colors.black,
                  ),
                  Switch(
                      value: newValue,
                      activeColor: Colors.amber,
                      onChanged: (bool value) {
                        setState(() {
                          newValue = value;

                          if (newValue) {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(const ThemeChanged(theme: AppTheme.light));
                          } else {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(const ThemeChanged(theme: AppTheme.dark));
                          }
                        });
                      }),
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.amber[400],
                  ),
                ],
              ),
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
            ListTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "All Stores",
            ),
            ListTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Offers",
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            //   child: DropdownButtonFormField(
            //       isExpanded: true,
            //       items: theme
            //           .map<DropdownMenuItem<String>>(
            //               (e) => DropdownMenuItem(value: e, child: Text(e)))
            //           .toList(),
            //       onChanged: (String? value) {
            //         if (value == "System") {
            //           BlocProvider.of<ThemeBloc>(context)
            //               .add(const ThemeChanged(theme: AppTheme.system));
            //         } else if (value == "Light") {
            //           BlocProvider.of<ThemeBloc>(context)
            //               .add(const ThemeChanged(theme: AppTheme.light));
            //         } else {
            //           BlocProvider.of<ThemeBloc>(context)
            //               .add(const ThemeChanged(theme: AppTheme.dark));
            //         }
            //       }),
            // ),

            const Divider(),
            ListTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/deal.png",
              tileName: "Daily Deals",
            ),
            ListTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Egg Club",
            ),
            ListTileWidget(
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Egg Club",
            ),
          ],
        ),
      ),
      // ==============================================BODY=========================

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ==============================================slide bars of types of groceries=========================

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SideBarWidget(
                      barName: 'Grocery',
                      image: "assets/icons/groceries.png",
                    ),
                    SideBarWidget(
                      barName: 'Pharmacy',
                      image: "assets/icons/capsules.png",
                    ),
                    SideBarWidget(
                      barName: 'Cookups',
                      image: "assets/icons/stir-fry.png",
                    ),
                  ],
                ),
              ),

              // ==============================================slide bars of posters==========================

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DealSHorizontalBarWidget(
                      dealsname: 'Daily Deals',
                      imageName: "assets/images/dim-offer.jpg",
                      color: Colors.blueGrey,
                    ),
                    DealSHorizontalBarWidget(
                      dealsname: 'Best Price',
                      imageName: "assets/images/chaal-offer.jpg",
                      color: const Color.fromARGB(255, 230, 209, 143),
                    ),
                    DealSHorizontalBarWidget(
                      dealsname: 'Protein',
                      imageName: "assets/images/Chaldal-Offer.jpg",
                      color: const Color.fromARGB(255, 230, 215, 84),
                    ),
                    DealSHorizontalBarWidget(
                      dealsname: 'Gogo Bangla',
                      imageName: "assets/images/cooking.jpg",
                      color: const Color.fromARGB(255, 9, 59, 100),
                    ),
                    DealSHorizontalBarWidget(
                      dealsname: 'Toiletries',
                      imageName: "assets/images/combo-offer-pack.jpg",
                      color: const Color.fromARGB(255, 9, 100, 14),
                    ),
                  ],
                ),
              ),

              // ==============================================Daily deals limited stock==========================

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenHeight / 7.1,
                  width: screenWidth / 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 127, 185, 233),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Daily Deals",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Container(
                                height: 30,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 149, 172, 184),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text("10H:57M:32S",
                                      style: textTheme.bodyMedium!
                                          .copyWith(fontSize: 18)
                                      // TextStyle(
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 18),
                                      ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Order over 99 to activate"),
                        const Text("*Limited Stock")
                      ],
                    ),
                  ),
                ),
              ),

              // ==============================================Categories==========================

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.6),
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesBarWidget(
                      categoryname: 'Ramadan',
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => AllCategoriesScreen())));
                  },
                  child: const Text("All Categories")),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Popular",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Flash Sales",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fresh Vegetables",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text("View more >", style: textTheme.displayMedium

                        // TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 18,
                        //     color: Colors.purple),
                        ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Biscuits",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Salt & Sugar",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Fresh Fruits",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Noodles",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Oil",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    Text(
                      "View more >",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef',
                      imageName: "assets/images/chaldal-premium-beef.webp",
                      price: '819BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Front Leg Bone',
                      imageName: "assets/images/beef-front-leg-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                    CardItemWidget(
                      dealsname: 'Chaldal Premium Beef Kuruli Bone',
                      imageName: "assets/images/beef-kuruli-bone.jpg",
                      price: '959BDT',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesBarWidget extends StatelessWidget {
  String categoryname;
  CategoriesBarWidget({
    Key? key,
    required this.categoryname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 197, 217, 236),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            categoryname,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              "assets/images/ramadan2.png",
              fit: BoxFit.cover,
              height: 140,
              width: 110,
            ),
          ),
        ],
      ),
    );
  }
}
