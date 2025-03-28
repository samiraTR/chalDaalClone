import 'package:flutter/material.dart';
import 'package:tst_app2/main.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/widgets/side_bar.dart';
import 'package:tst_app2/utils/constants.dart';

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
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
    {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration = Theme.of(context).inputDecorationTheme;
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
          bottomNavRes = false;
        });
        return false;
      },
      child: Scaffold(
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
                        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.8),
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
      ),
    );
  }
}
