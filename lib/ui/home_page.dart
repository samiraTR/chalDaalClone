import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tst_app2/bloc/theme_bloc.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/ui/all_categories.dart';
import 'package:tst_app2/ui/cash_image.dart';
import 'package:tst_app2/ui/city_selection.dart';
import 'package:tst_app2/ui/product_details.dart';
import 'package:tst_app2/ui/search_product.dart';
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
  PageController pageController = PageController();

  double screenHeight = 0.0;
  double screenWidth = 0.0;
  @override
  void initState() {
    super.initState();

    homeColorNav = Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

    return Scaffold(
      appBar: AppBar(
          title: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 180,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        onTap: () {
                          setState(() {
                            final res = AllServices().getLatLong();
                            print("res $res");

                            if (res == "") {
                              bool loading = false;
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    Timer(const Duration(seconds: 3), () {
                                      loading = true;
                                      if (loading) {
                                        Navigator.pop(context);

                                        Navigator.pop(context);
                                      }
                                    });

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(80),
                                            child: CircularProgressIndicator(
                                              // strokeWidth: 15,
                                              // value: 0.3,
                                              color: Colors.purple,
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          });
                        },
                        leading: SizedBox(
                          height: 70,
                          width: 70,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 3,
                            child: const Icon(
                              Icons.location_searching,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        title: const Text(
                          "Use my current location",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 3,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: SizedBox(
                          height: 70,
                          width: 70,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 3,
                            child: const Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AllCities()));
                        },
                        title: const Text(
                          "Change City",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Row(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.purple, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SizedBox(
                          height: 180,
                        );
                      });
                },
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
        ),
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
            ListTileWidget(
              // ontap: () => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const CashImage())),
              icon: Icons.keyboard_arrow_right_rounded,
              image: "assets/icons/football-club.png",
              tileName: "Cash Image",
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return const AlertDialog(
                            content: SizedBox(
                              height: 200,
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: screenHeight / 6.5,
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
                                    child: Text(
                                      "10H:57M:32S",
                                      style: textTheme.bodyMedium!.merge(
                                          const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),

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
                            builder: (context) =>
                                const AllCategoriesScreen())));
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
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: saltNSugar.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: saltNSugar[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: saltNSugar[index]["name"],
                            imageName: saltNSugar[index]["imageName"],
                            price: saltNSugar[index]["price"],
                            quantity: saltNSugar[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
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
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: saltNSugar.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: saltNSugar[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: saltNSugar[index]["name"],
                            imageName: saltNSugar[index]["imageName"],
                            price: saltNSugar[index]["price"],
                            quantity: saltNSugar[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),

              // const SizedBox(
              //   height: 30,
              // ),
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
                    Text("View more >",
                        style: textTheme.titleMedium
                            ?.merge(const TextStyle(color: Colors.purple))),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: saltNSugar.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: saltNSugar[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: saltNSugar[index]["name"],
                            imageName: saltNSugar[index]["imageName"],
                            price: saltNSugar[index]["price"],
                            quantity: saltNSugar[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
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
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: biscuits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: biscuits[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: biscuits[index]["name"],
                            imageName: biscuits[index]["imageName"],
                            price: biscuits[index]["price"],
                            quantity: biscuits[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
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
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: saltNSugar.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: saltNSugar[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: saltNSugar[index]["name"],
                            imageName: saltNSugar[index]["imageName"],
                            price: saltNSugar[index]["price"],
                            quantity: saltNSugar[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
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
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: freshFruits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: freshFruits[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: freshFruits[index]["name"],
                            imageName: freshFruits[index]["imageName"],
                            price: freshFruits[index]["price"],
                            quantity: freshFruits[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
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
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: noodles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                          productDetail: noodles[index],
                                        )));
                          },
                          child: CardItemWidget(
                            dealsname: noodles[index]["name"],
                            imageName: noodles[index]["imageName"],
                            price: noodles[index]["price"],
                            quantity: noodles[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 15,
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
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: oil.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productDetail: oil[index],
                                ),
                              ),
                            );
                          },
                          child: CardItemWidget(
                            dealsname: oil[index]["name"],
                            imageName: oil[index]["imageName"],
                            price: oil[index]["price"],
                            quantity: oil[index]["quantity"],
                            id: saltNSugar[index]["id"],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 120,
                color: newValue
                    ? const Color.fromARGB(255, 235, 229, 229)
                    : const Color.fromARGB(255, 116, 113, 113),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text(
                          "Need Help?",
                          style: textTheme.headlineSmall,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Chip(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            padding: EdgeInsets.all(13),
                            avatar: Icon(
                              Icons.message,
                              size: 20,
                              color: Colors.purple,
                            ),
                            label: Text(
                              "Live Chat",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                          Chip(
                            backgroundColor: Colors.white,
                            // padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                            padding: EdgeInsets.all(13),

                            elevation: 3,
                            avatar: Icon(
                              Icons.call,
                              size: 18,
                              color: Colors.purple,
                            ),
                            label: Text(
                              "Call",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                          Chip(
                            backgroundColor: Colors.white,
                            // padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                            padding: EdgeInsets.all(13),

                            elevation: 3,
                            avatar: Icon(
                              Icons.question_mark_sharp,
                              size: 17,
                              color: Colors.purple,
                            ),
                            label: Text(
                              "FAQ",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(

      //     onTap: (value) {
      //       setState(() {
      //         _currentIndex = value;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.category_outlined), label: "Categories"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search), label: "Search"),
      //     ])
      // ClipRRect(
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      //     child: Container(
      //       decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomRight,
      //           colors: [
      //             Color.fromARGB(0, 247, 238, 238),
      //             Colors.white,
      //           ],
      //         ),
      //       ),
      //       height: 50,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               setState(() {});
      //               homeNav = "assets/icons/house-black.png";
      //               categoryNav = "assets/icons/menu.png";
      //               menuColorNav = Colors.black;

      //               homeColorNav = Colors.purple;
      //             },
      //             child: Image.asset(
      //               homeNav,
      //               height: 30,
      //               width: 50,
      //               color: homeColorNav,
      //             ),
      //           ),
      //           InkWell(
      //             onTap: () {
      //               setState(() {
      //                 categoryNav = "assets/icons/category.png";
      //                 homeNav = "assets/icons/home.png";
      //                 homeColorNav = Colors.black;
      //                 menuColorNav = Colors.purple;
      //               });

      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => AllCategoriesScreen()));
      //             },
      //             child: Image.asset(
      //               categoryNav,
      //               height: 30,
      //               width: 50,
      //               color: menuColorNav,
      //             ),
      //           ),
      //           Image.asset(
      //             "assets/icons/search.png",
      //             height: 30,
      //             width: 50,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Colors.purple,
      //     unselectedItemColor: Colors.grey,
      //     selectedIconTheme: const IconThemeData(size: 32),
      //     currentIndex: _currentIndex,
      //     onTap: (value) {
      //       print(value);
      //       setState(() {
      //         _currentIndex = value;
      //         if (_currentIndex == 1) {
      //           Navigator.push(
      //               context,
      //               (MaterialPageRoute(
      //                   builder: (context) => AllCategoriesScreen())));
      //         }
      //         // pageController.animateToPage(_currentIndex,
      //         //     duration: const Duration(milliseconds: 100),
      //         //     curve: Curves.linear);
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.category_outlined), label: "Categories"),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      //     ]),
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
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return Container(
      height: 140,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 197, 217, 236),
          boxShadow: [
            BoxShadow(
                offset: Offset.fromDirection(1),
                blurRadius: 2,
                spreadRadius: 0.5,
                color: Colors.grey)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            categoryname,
            style: textTheme.bodyLarge?.copyWith(color: cOLORBlack),
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
