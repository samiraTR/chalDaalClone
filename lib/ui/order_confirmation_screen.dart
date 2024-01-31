// import 'package:flutter/material.dart';
// import 'package:tst_app2/model/oulets_model.dart';
// import 'package:tst_app2/themes/theme.dart';
// import 'package:tst_app2/ui/customer_list.dart';
// import 'package:tst_app2/utils/theme.dart';

// class OrderConfirmationScreen extends StatefulWidget {
//   const OrderConfirmationScreen({super.key});

//   @override
//   State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
// }

// class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
 
//       body: Scaffold(
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Container(
//               color: mainColor,
//               height: 1000,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(flex: 1,
//                       child: Column(
                        
//                         children: [
//                          const SizedBox(height: 15,),
//                             Center(child: Image.asset("assets/icons/outlet_location.png",height: 40, width: 50,)),
//                         ],
//                       ),
//                     ),
//                   const  SizedBox(width: 7,),
//                  Expanded(
//                   flex: 5,
//                    child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                          const SizedBox(height: 20,),
//                           Row(
//                             children: [
//                             Text("Ahnaf Shahriar Rhyme",style: TextStyle(color: white,fontSize: 19),), 
//                             ],
//                           ),
//                         const  Row(
//                             children: [
//                               Text("Mohammadpur,Dhaka",style: TextStyle(color: Colors.white70,fontSize: 14),),
//                             ],
//                           )
                            
//                         ],
//                       ),
//                  ),
//                     Expanded(
//                       child: Column(
                        
//                         children: [
//                          const SizedBox(height: 10,),
//                           IconButton(onPressed: (){
//                             Navigator.push(
//                         context,
//                         (MaterialPageRoute(
//                             builder: (context) => CutomerListScreen())));
//                           }, icon: Icon(Icons.edit,color: white,))
                      
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//               Positioned(
//               top: 90,
//               child: SingleChildScrollView(
//                 child: Container(
//                   height:1000, 
//                   width:MediaQuery.of(context).size.width,
//                   decoration:const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(topLeft:Radius.circular(25) ,topRight:Radius.circular(25)  )
//                   ),
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 20,left: 20,right:20),
//                      child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                               // Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 8,
//                                 child:  Text("Market Return ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
//                                 Expanded(flex: 2,
//                                   child: ElevatedButton(
//                                      style: ElevatedButton.styleFrom(primary: mainColor),
//                                     onPressed: (){},child: Text("ADD"),)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Row(
//                             children: [
//                               // Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 8,
//                                 child:  Text("POSM ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
//                                 Expanded(flex: 2,
//                                   child: ElevatedButton(
//                                      style: ElevatedButton.styleFrom(primary: mainColor),
//                                     onPressed: (){},child:const Text("ADD"),)),
//                             ],
//                           ),
//                         ),
//                          //Text("Market Return ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),
//                         Padding(
//                         padding: const EdgeInsets.only(top: 4),
//                           child: Row(
//                             children: [
//                               Expanded(flex: 8,
//                                 child: Text("Order Summery ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),)),
//                                 Expanded(child: IconButton(icon: Icon(Icons.edit),onPressed: () {
                                  
//                                 },))
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                                Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 7,
//                                 child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                                Expanded(child: Text("2. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 7,
//                                 child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                                Expanded(child: Text("3. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 7,
//                                 child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                                Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 7,
//                                 child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(top: 10,bottom: 10),
//                           child: Divider(thickness: 2,),
//                         ),
        
//                         Padding(
//                           padding: const EdgeInsets.only(top: 0),
//                           child: Row(
//                             children: [
//                             //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 8,
//                                 child: Text("Subtotal",style: TextStyle(fontSize: 16,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                             //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 8,
//                                 child: Text("Discount",style: TextStyle(fontSize: 16,color: blackColor),)),
//                                 Expanded(flex: 2,
//                                   child: Text(" TK 20 ",style: TextStyle(fontSize: 14,color: blackColor),)),
//                             ],
//                           ),
//                         ),
//                          const Padding(
//                           padding: EdgeInsets.only(top: 10,bottom: 10),
//                           child: Divider(thickness: 2,),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 0),
//                           child: Row(
//                             children: [
//                             //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                              
//                               Expanded(flex: 8,
//                                 child: Text("Total",style: TextStyle(fontSize: 16,color: blackColor,fontWeight: FontWeight.bold),)),
//                                 Expanded(flex: 2,
//                                   child: Text("TK 270 ",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.bold),)),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 130,),
                        
//            Container(
//                     color: white,
//                     child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
                              
                                  
                                     
//                               Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(7.0),
//                                         child: Container(
//                                           height: 55,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                                   color:const Color.fromARGB(255, 61, 80, 251),
                                              
//                                               ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               const Text(
//                                                 "Checkout",
//                                                 style: textSTYLEHeadline16,
//                                               ),
//                                               Card(
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   color: mainColor,
//                                                   child: const Padding(
//                                                     padding: EdgeInsets.all(10.0),
//                                                     child: Text(
//                                                       "    ৳270    ",
//                                                       style: textSTYLEHeadline15,
//                                                     ),
//                                                   ))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   // : SizedBox.shrink(),
//                               // Expanded(
//                               //   child: BottomNavigationBar(
//                               //       selectedItemColor: Colors.purple,
//                               //       unselectedItemColor: Colors.grey,
//                               //       selectedIconTheme:
//                               //           const IconThemeData(size: 32),
//                               //       currentIndex: currentIndex,
//                               //       onTap: (value) {
//                               //         print(value);
//                               //         setState(() {
//                               //           currentIndex = value;
//                               //           pageController.animateToPage(currentIndex,
//                               //               duration:
//                               //                   const Duration(milliseconds: 100),
//                               //               curve: Curves.linear);
//                               //         });
//                               //       },
//                               //       items: const [
//                               //         BottomNavigationBarItem(
//                               //             icon: Icon(Icons.home), label: "Home"),
//                               //         BottomNavigationBarItem(
//                               //             icon: Icon(Icons.category_outlined),
//                               //             label: "Categories"),
//                               //         BottomNavigationBarItem(
//                               //             icon: Icon(Icons.search),
//                               //             label: "Search"),
//                               //       ]),
//                               // ),
//                             ],
//                           ),
//                   )
//                         // Text("Lays  ASCO 30.50gm ",style: TextStyle(fontSize: 14,color: blackColor),),
//                         //  Text("Lays  ASCO 30.50gm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: blackColor),),
//                         // Text("Lays  ASCO 30.50gm ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: blackColor),),
//                       ]
//                      ),
//                    ),     
//                 ),
//               ),
//             ),
//             // Container(
//             //   color: mainColor,
//             //   height: 300,
//             // )
//             ],
//           ),
//         ),
//       )

//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/customer_list.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/market_return.dart';
import 'package:tst_app2/ui/pageControllers.dart';
import 'package:tst_app2/ui/posm_screen.dart';
import 'package:tst_app2/utils/theme.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Center(
                          child: Image.asset(
                            "assets/icons/outlet_location.png",
                            height: 40,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Ahnaf Shahriar Rhyme",
                              style: TextStyle(color: white, fontSize: 19),
                            ),
                          ],
                        ),
                     const   Row(
                          children: [
                            Text(
                              "Mohammadpur, Dhaka",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CutomerListScreen(
                                  fromScreenName: 'order_confirm',
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit, color: white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 110,
            child: SingleChildScrollView(
              child: Container(
                height: 1000,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            // Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 8,
                              child:  Text("Market Return ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
                              Expanded(flex: 2,
                                child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(primary: mainColor),
                                  onPressed: (){
                                    Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => MarketReturnScreen())));

                                  },child: Text("ADD"),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                          
                            
                            Expanded(flex: 8,
                              child:  Text("POSM ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),),
                              Expanded(flex: 2,
                                child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(primary: mainColor),
                                  onPressed: (){
                                     Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => POSMScreen())));
                                  },child:const Text("ADD"),)),
                          ],
                        ),
                      ),
                       //Text("Market Return ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),),
                      Padding(
                      padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            Expanded(flex: 8,
                              child: Text("Order Summery ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: mainColor),)),
                              Expanded(child: IconButton(icon: Icon(Icons.edit),onPressed: () {
                                 Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => PageControllerScreen(bottomNav: 1,))));
                                
                              },))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                             Expanded(child: Text("1. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 7,
                              child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                             Expanded(child: Text("2. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 7,
                              child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                             Expanded(child: Text("3. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 7,
                              child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                             Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 7,
                              child: Text("Lays  ASCO 30.50gm",style: TextStyle(fontSize: 15,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Divider(thickness: 2,),
                      ),
      
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                          //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 8,
                              child: Text("Subtotal",style: TextStyle(fontSize: 16,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text("TK 290 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                          //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 8,
                              child: Text("Discount",style: TextStyle(fontSize: 16,color: blackColor),)),
                              Expanded(flex: 2,
                                child: Text(" TK 20 ",style: TextStyle(fontSize: 14,color: blackColor),)),
                          ],
                        ),
                      ),
                       const Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Divider(thickness: 2,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                          //   Expanded(child: Text("4. ",style: TextStyle(fontSize: 14,color: blackColor),)),
                            
                            Expanded(flex: 8,
                              child: Text("Total",style: TextStyle(fontSize: 16,color: blackColor,fontWeight: FontWeight.bold),)),
                              Expanded(flex: 2,
                                child: Text("TK 270 ",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      ),
                            
                          ],
                        ),

                      ),
                    

                      const SizedBox(height: 160),

                      
                      GestureDetector(
                        onTap: (){
                //           Navigator.push(context,
                //  MaterialPageRoute(builder: (_) =>  POSMScreen()));
                          
                        },
                        child: Container(
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 61, 80, 251),
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
                                                BorderRadius.circular(10),
                                          ),
                                          color: mainColor,
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "    ৳270    ",
                                              style: textSTYLEHeadline15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}