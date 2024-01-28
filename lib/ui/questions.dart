import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/customer_list.dart';
import 'package:tst_app2/ui/pageControllers.dart';
import 'package:tst_app2/utils/theme.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
    File? imageFile;
  final picker = ImagePicker();
  Map<String, bool> checklist = {};
  // List<String> questions = [
  //   'আপনি কি স্টক কাউন্ট করেছেন ?',
  //   'আপনি কি কোনো পরিবর্তন করেছেন ?',
  //   'আপনি কি স্টক কাউন্ট সম্পূর্ণ করেছেন ?',
  // ];
    List<String> questions = [
    'Did you perform a stock count?',
    'Did you perform merchandising operations?',
    'Promo SKU(s)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Questions ",
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        actions: [ 
          GestureDetector(
            onTap: (() {
              for(int i=0; i<questions.length;i++){
                checklist[questions[i]] =true;
              }
          setState(() {
            
          });
                   

                                     
              
              
            }),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/icons/select_all.png",color: white,),
            ),
          )

        ],
      ),
      body:
         Padding(
           padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
           child: Column(
            children: [


              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: checklist[questions[index]] == true
                                ? mainShadeColorNow
                                : Colors.transparent,
                            child: CheckboxListTile(
                              checkColor: white,
                              activeColor: mainColor,
                              title: Text(questions[index].toString()
                                
                                  ),
                              value: checklist[questions[index]]?? false,
                              onChanged: (value) {
                                setState(() {
                                  checklist[questions[index]] = value!;
                                });
                              },
                            ),
                          ),
                          const Divider(
                            height: 3,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _capturePhoto();

               if (imageFile!=null){
                Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => PageControllerScreen(bottomNav: 1))));

               }
    
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                      color:const Color.fromARGB(255, 61, 80, 251),
                                                  
                                                  ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  const Text(
                                                    "Take a Image ",
                                                    style: textSTYLEHeadline16,
                                                  ),
                                                  Image.asset("assets/icons/camera.png",color: white,)
                                                ],
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
                      ),
                ),
              )
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           (MaterialPageRoute(
              //               builder: (context) => PageControllerScreen(bottomNav: 1))));
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 50,
              //         width: 150,
              //         decoration: BoxDecoration(
              //             color: mainColor,
              //             borderRadius: BorderRadius.circular(10)),
              //         child: Center(
              //             child: Text(
              //           "Next",
              //           style: TextStyle(fontSize: 16, color: white),
              //         )),
              //       ),
              //     ),
              //   ),
              // )
            ],
                 ),
         ),
         
     

    );
  }
  Future<void> _capturePhoto() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } else {
      print('Camera permission denied');
    }
  }
}