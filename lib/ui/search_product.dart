import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/main.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/ui/all_categories.dart';
import 'package:tst_app2/ui/home_page.dart';

class SearchproductScreen extends StatefulWidget {
  const SearchproductScreen({super.key});

  @override
  State<SearchproductScreen> createState() => _SearchproductScreenState();
}

class _SearchproductScreenState extends State<SearchproductScreen> {
  Box? box;
  List unsplashData = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bottomNavRes = true;
    hiveBox();
  }

  hiveBox() async {
    final box = await Hive.box("imageList");
    var a = box.get("imageData");
    // unsplashData = box.toMap().values.toList();
    for (var ele in a) {
      if (ele == null) {
        ele = "No Data";
      }
      unsplashData.add(ele);
      setState(() {});

      print(
          "if null aaaaaaaaaaas ${unsplashData.any((element) => element == null)}");
    }
    // unsplashData.where((element) {
    //   return element == null ? element = "No result" : element;
    // });
    print("unsplashData from ${unsplashData.length}");
    print("unsplashData from $unsplashData");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void runFilter(String enteredKeyword) {
    box = Hive.box("imageList");
    List a = box?.get("imageData");

    List results = a;
    if (enteredKeyword.isEmpty) {
      unsplashData = results;
    } else {
      print("unsplashData.length1 ${unsplashData.length}");
      print("results.length1 ${results.length}");

      if (results.any((element) => element != null)) {
        var starts = results
            .where((s) => s["user"]["name"]
                .toLowerCase()
                .startsWith(enteredKeyword.toLowerCase()))
            .toList();

        var contains = results
            .where((s) =>
                s["user"]["name"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) &&
                !s["user"]["name"]
                    .toLowerCase()
                    .startsWith(enteredKeyword.toLowerCase()))
            .toList()
          ..sort((a, b) => a["user"]["name"]
              .toLowerCase()
              .compareTo(b["user"]["name"].toLowerCase()));

        results = [...starts, ...contains];
      } else {
        unsplashData = results;
      }
    }

    // Refresh the UI
    setState(() {
      unsplashData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
          bottomNavRes = false;
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Search"),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: unsplashData.length,
                  itemBuilder: (context, index) {
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CachedNetworkImage(
                          imageUrl: unsplashData[index]["urls"]["small"],
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text(unsplashData[index]["id"]),
                              Text(
                                unsplashData[index]["user"]["name"],
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,

                                // textAlign: TextAlign.justify,
                                style: textTheme.bodyMedium?.copyWith(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                unsplashData[index]["alt_description"] ??
                                    "No Description",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
        bottomNavigationBar: bottomNavRes == true
            ? Container(
                width: 180,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            bottomNavRes = false;
                          });
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ),
                          );

                          // Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.keyboard_backspace_rounded)),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 235, 227, 227),
                          ),
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              runFilter(value);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
