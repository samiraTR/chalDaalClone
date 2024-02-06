import 'package:flutter/material.dart';
import 'package:tst_app2/model/Hive_model/check_out_model.dart';
import 'package:tst_app2/model/Hive_model/checkout_data.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/order_confirmation_screen.dart';
import 'package:tst_app2/ui/search_product.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class PageControllerScreen extends StatefulWidget {
  
  int bottomNav;
  // String totalCartAmount ;
  PageControllerScreen({Key? key, required this.bottomNav,}) : super(key: key);
  @override
  State<PageControllerScreen> createState() => _PageControllerScreenState();
}

class _PageControllerScreenState extends State<PageControllerScreen> {
  //String totalCartAmount = "";

  int currentIndex = 0; 
  
  
   PageController pageController = PageController();
  


  List unsplashData = [];
  bool addToCart = false;
  final navigationPages = [
    //const HomePage(),
    // AllProductListScreen(checkoutDataModel: CheckoutDataModel(cid: '', userId: "", userPass: "", deviceId: "", clientId: "", clientName: "", orderDate: "", orderTime: "", deliveryDate: "", deliveryTime: "", paymentMode: "", latitude: "", longitude: "", allItem: [], offer: "", rakList: "", note: ""),
    // total:"" ,
    //   ),
    // AllProductListScreen(
    //   // clientName:"",
    //   // clientId:""
    // ),
    // const AllCategoriesScreen(),
    const SearchproductScreen()
  ];
 // int _currentPage=0;
  

  
  @override
  void initState() {
  currentIndex=widget.bottomNav;
  pageController = PageController(initialPage: widget.bottomNav);
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
                        if (value == 1) {
                          

                          // bottomNavRes = true;
                        } 

                        // if (value == 2) {
                        //   // bottomNavRes = true;
                        // } 
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
                              Expanded(
                                      child: GestureDetector(
                                        onTap: (() {
                        //                   Navigator.push(
                        // context,
                        // (MaterialPageRoute(
                        //     builder: (context) => OrderConfirmationScreen(chekoutDataModel: null,))));
                                          
                                        }),
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
                                                    child:  Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Text(
                                                        "    ৳${totalCartAmount}     ",
                                                        style: textSTYLEHeadline15,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
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