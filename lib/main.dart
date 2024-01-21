import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tst_app2/bloc/theme_bloc.dart';
import 'package:tst_app2/local_storage/hive_adapters.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/search_product.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveAdapters().hiveAllAdapterBox();
  
  await Hive.openBox("imageList");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int _currentIndex = 0;
  List unsplashData = [];
  bool addToCart = false;
  final navigationPages = [
    const HomePage(),
     const HomePage(),
    //const AllCategoriesScreen(),
    const SearchproductScreen()
  ];
  PageController pageController = PageController();

  @override
  void initState() {
    // apicall();

    super.initState();
  }

  // apicall() async {
  //   int pageNumber = 1;
  //   final box = await Hive.box("imageList");
  //   var a = box.get("imageData");

  //   print("x  ${unsplashData.length} $pageNumber");
  //   for (int i = pageNumber; i < 20; i++) {
  //     List x = await Repositories().getImageRepo(pageNumber);

  //     for (var a in x) {
  //       unsplashData.add(a);
  //     }

  //     box.put("imageData", unsplashData);

  //     pageNumber++;
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: state.themeData,
              home: Scaffold(
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                        if (value == 2) {
                          bottomNavRes = true;
                        } else {
                          bottomNavRes = false;
                        }
                      });
                    },
                    children: navigationPages,
                  ),
                  bottomNavigationBar:  Container(
                    color: white,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // addToCart
                              //     ? 
                                  
                                  
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                                  color:const Color.fromARGB(255, 61, 80, 251),
                                              
                                              ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                "Checkout",
                                                style: textSTYLEHeadline16,
                                              ),
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  color: mainColor,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(10.0),
                                                    child: Text(
                                                      "    ৳400     ",
                                                      style: textSTYLEHeadline15,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: BottomNavigationBar(
                                    type: BottomNavigationBarType.fixed,
                                      elevation: 0.0,
                                      backgroundColor: Colors.white,
                                      selectedItemColor: mainColor,
                                      unselectedItemColor: Colors.black,
                                      selectedIconTheme:
                                          const IconThemeData(size: 32),
                                      currentIndex: currentIndex,
                                      onTap: (value) {
                                       // print(value);
                                        setState(() {
                                          currentIndex = value;
                                          pageController.animateToPage(currentIndex,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.linear);
                                        });
                                      },
                                      items:  [
                                       currentIndex==0? BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/homePage_fill.png",color:mainColor, height: 30,),label: "" ):BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/homepage.png",color:Colors.black, height: 30,),label: "" ),
                                      currentIndex==1? BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/category_fill.png",color:mainColor, height: 30,),label: ""
                                            ) :  BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/category1.png",color:Colors.black, height: 30,),label: ""
                                            ),
                                        
                                       BottomNavigationBarItem(
                                            icon: Image.asset("assets/icons/search1.png",color:currentIndex==2?mainColor: Colors.black, height: 30,),label: ""
                                            ),
                                      ]),
                                ),
                              ), 
                                  // : SizedBox.shrink(),
                              // Expanded(
                              //   child: BottomNavigationBar(
                              //       selectedItemColor: Colors.purple,
                              //       unselectedItemColor: Colors.grey,
                              //       selectedIconTheme:
                              //           const IconThemeData(size: 32),
                              //       currentIndex: currentIndex,
                              //       onTap: (value) {
                              //         print(value);
                              //         setState(() {
                              //           currentIndex = value;
                              //           pageController.animateToPage(currentIndex,
                              //               duration:
                              //                   const Duration(milliseconds: 100),
                              //               curve: Curves.linear);
                              //         });
                              //       },
                              //       items: const [
                              //         BottomNavigationBarItem(
                              //             icon: Icon(Icons.home), label: "Home"),
                              //         BottomNavigationBarItem(
                              //             icon: Icon(Icons.category_outlined),
                              //             label: "Categories"),
                              //         BottomNavigationBarItem(
                              //             icon: Icon(Icons.search),
                              //             label: "Search"),
                              //       ]),
                              // ),
                            ],
                          ),
                  )
               ),);
        },
      ),
    );
  }
}
