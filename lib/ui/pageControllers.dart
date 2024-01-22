import 'package:flutter/material.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/search_product.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class PageControllerScreen extends StatefulWidget {
  int bottomNav;
   PageControllerScreen({super.key, required this.bottomNav});

  @override
  State<PageControllerScreen> createState() => _PageControllerScreenState();
}

class _PageControllerScreenState extends State<PageControllerScreen> {
  
   PageController pageController = PageController(initialPage:1);
  


  List unsplashData = [];
  bool addToCart = false;
  final navigationPages = [
    const HomePage(),
   const  AllProductListScreen(),
    //const AllCategoriesScreen(),
    const SearchproductScreen()
  ];
  int _currentPage=0;
  

  
  @override
  void initState() {
  currentIndex=widget.bottomNav;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;

                        if (value == 2) {
                          bottomNavRes = true;
                        } 
                        else {
                          bottomNavRes = false;
                        }
                      });
                    },
                    children:navigationPages
                    ,
                  ),
                  bottomNavigationBar:  Container(
                    color: white,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
               );
  }
}