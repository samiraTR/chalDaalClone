import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tst_app2/service/constants.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/themes/theme.dart';
import 'package:tst_app2/ui/widgets/side_bar.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  List categories = [
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Groceries",
          style: textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ClipRRect(
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      //     child: Container(
      //       decoration: const BoxDecoration(
      //           gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomRight,
      //         colors: [
      //           Color.fromARGB(0, 245, 243, 243),
      //           Colors.white,
      //         ],
      //       )),
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

      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => HomePage()));
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
    );
  }
}
